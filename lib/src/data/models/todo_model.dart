part of 'models.dart';

class TodoModel extends Todo {
  const TodoModel({
    String? title,
    String? description,
    String? createDate,
    bool? completed
  }) : super(
    title: title,
    description: description,
    createDate: createDate,
    completed: completed
        );

  factory TodoModel.fromJson(Map<dynamic, dynamic> map) {
    return TodoModel(
      title: map['title'] != null ? map['title'] as String: null,
      description: map['description'] != null ? map['description'] as String: null,
      createDate: map['create_date'] != null ? map['create_date'] as String: null,
      completed: map['completed'] != null ? map['completed'] as bool: false
    );
  }

}
