import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/src/data/models/models.dart';
import 'package:todo_app/src/presentations/values/values.dart';

import '../../../../core/utils/db_utils.dart';

class HomeItem extends StatefulWidget {
  const HomeItem(
      {super.key,
      required this.title,
      required this.iconData,
      required this.iconColor});

  final String title;
  final IconData iconData;
  final Color iconColor;

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  List<String> todoList = [];

  @override
  void initState() {
    super.initState();
    _getTodoList();
  }

  //Retrieve Data from Table
  _getTodoList() async {
    Box box = await Hive.openBox(DBUtils.dbName);
    List<String>? dataList = box.get(DBUtils.todoTableName);
    if (dataList != null) {
      setState(() {
        todoList = dataList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getHomeItemContainer;
  }

  //Home Item Container
  Widget get _getHomeItemContainer => Container(
        decoration: BoxDecoration(
            color: AppColors.primaryGrey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(Sizes.radius20)),
        margin: const EdgeInsets.all(Sizes.margin4),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getIcon,
                Text(
                  _getCount().toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: Sizes.height10,
            ),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            )
          ],
        ),
      );

  //Icon
  get _getIcon => Container(
        decoration: BoxDecoration(
            color: widget.iconColor,
            borderRadius: BorderRadius.circular(Sizes.radius20)),
        padding: const EdgeInsets.all(Sizes.padding4),
        child: Icon(
          widget.iconData,
          color: AppColors.white,
        ),
      );

  //Count
  _getCount() {
    switch (widget.title) {
      case 'Today':
        return _getTodayCount();

      case 'Completed':
        return _getCompletedCount();

      case 'Remaining':
        return _getRemainCount();

      default:
        return 0;
    }
  }

  //Today Todo Counter
  _getTodayCount() {
    return todoList
        .where((data) =>
            TodoModel.fromJson(json.decode(data)).createDate ==
            DateFormat(StringConst.dateFormatText).format(DateTime.now()))
        .length;
  }

  //Completed Counter
  _getCompletedCount() {
    return todoList
        .where((data) => TodoModel.fromJson(json.decode(data)).completed!)
        .length;
  }

  //Remain Counter
  _getRemainCount() {
    return todoList
        .where((data) => !TodoModel.fromJson(json.decode(data)).completed!)
        .length;
  }
}
