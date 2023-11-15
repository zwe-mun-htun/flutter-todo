import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo_app/src/presentations/values/values.dart';

import '../../../../domain/entities/entities.dart';

class TodoItem extends StatefulWidget {
  const TodoItem(
      {super.key,
      required this.todo,
      required this.onValueDeleteChanged,
      required this.onValueCompletedChanged});

  final Todo todo;
  final ValueChanged<Todo> onValueDeleteChanged;
  final ValueChanged<Todo> onValueCompletedChanged;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return _getTodoItemContainer;
  }

  //Home Item Container
  Widget get _getTodoItemContainer => SwipeActionCell(
        key: ValueKey(widget.todo.title),
        trailingActions: _getTrailingActions(),
        child: Container(
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
                children: [
                  _getIcon,
                  const SizedBox(
                    width: Sizes.width10,
                  ),
                  Text(
                    widget.todo.title.toString(),
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold, decoration: widget.todo.completed! ?TextDecoration.lineThrough: null),
                  )
                ],
              ),
              widget.todo.description != ''
                  ? const SizedBox(
                      height: Sizes.height10,
                    )
                  : const SizedBox.shrink(),
              widget.todo.description != ''
                  ? Text(
                      widget.todo.description.toString(),
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400, decoration: widget.todo.completed! ?TextDecoration.lineThrough: null),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      );

  //Get Trailing Icons
  List<SwipeAction> _getTrailingActions() {
    if (widget.todo.completed!) {
      return [_swipeDeleteAction];
    } else {
      return [_swipeDeleteAction, _swipeCompleteAction];
    }
  }

  SwipeAction get _swipeCompleteAction => SwipeAction(
      color: Colors.transparent,
      content: _getIconButton(AppColors.green, Iconsax.tick_circle),
      onTap: (handler) async {
        widget.onValueCompletedChanged(widget.todo);
      });

  SwipeAction get _swipeDeleteAction => SwipeAction(
      color: Colors.transparent,
      content: _getIconButton(AppColors.red, Iconsax.trash),
      onTap: (handler) async {
        widget.onValueDeleteChanged(widget.todo);
      });

  //Todo Icon
  get _getIcon => Container(
        decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(Sizes.radius20)),
        padding: const EdgeInsets.all(Sizes.padding4),
        child: const Icon(
          Iconsax.task_square,
          color: AppColors.white,
        ),
      );

  //Icon Color
  getColor() {
    if (widget.todo.completed!) {
      return AppColors.green;
    } else {
      return AppColors.primaryGrey;
    }
  }

  //Icon Button
  Widget _getIconButton(color, icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        /// set you real bg color in your content
        color: color,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
