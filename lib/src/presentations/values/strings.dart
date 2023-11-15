part of values;

class StringConst {
  //App Name
  static const String appTitle = "TODO App";

  //Search
  static const String searchText = "Search";

  //Home
  static const List<String> homeGridTextList = [
    'Today',
    'Completed',
    'Remaining',
  ];
  static const String todayText = "Today";
  static const String myTodoText = "My ToDos";
  static const String dateFormatText = "yyyy-MM-dd";
  static const String addText = "Add";
  static const String emptyTodoText = "No todo list for you!";

  //Todo Create
  static const String newTodoText = "New Todo";
  static const String titleText = "Title";
  static const String descriptionText = "Description";
  static const String invalidTitleText = "Please insert a valid title.";
  static const String createSuccessText =
      "You have successsfully created todo list.";

  //Todo Completed
  static const String updateSuccessText =
      "You have successsfully completed this todo.";

  //Todo Delete
  static const String deleteSuccessText = "Your Todo is successfully deleted.";
}
