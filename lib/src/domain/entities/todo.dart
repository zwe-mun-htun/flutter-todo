part of 'entities.dart';

class Todo extends Equatable {
  final String? title;
  final String? description;
  final String? createDate;
  final bool? completed;

  const Todo({this.title, this.description, this.createDate, this.completed});

  @override
  List<Object?> get props => [title, description, createDate, completed];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "create_date": createDate,
        "completed": completed
      };
}
