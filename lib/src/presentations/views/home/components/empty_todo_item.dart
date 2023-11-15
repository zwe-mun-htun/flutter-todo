import 'package:flutter/material.dart';

import '../../../values/values.dart';

class EmptyToDoItem extends StatefulWidget {
  const EmptyToDoItem({super.key});

  @override
  State<EmptyToDoItem> createState() => _EmptyToDoItemState();
}

class _EmptyToDoItemState extends State<EmptyToDoItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100,),
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('assets/images/empty-todo.jpg')),
          const SizedBox(height: 20,),
          const Text(StringConst.emptyTodoText, style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}
