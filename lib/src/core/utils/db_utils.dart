import 'package:hive/hive.dart';

class DBUtils {
  static String todoTableName = 'todo-list';
  static String dbName = 'todoDB';

  static saveListData(List<String>? data) async {
    Box box = await Hive.openBox(dbName);
    box.put(todoTableName, data);
  }
}
