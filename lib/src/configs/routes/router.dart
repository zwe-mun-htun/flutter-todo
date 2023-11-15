
import 'package:get/get.dart';

import '../../presentations/views/views.dart';
import 'routes.dart';

List<GetPage<dynamic>> pages = [

  //Home
  GetPage(name: rootRoute, page: () => const HomeSection()),

  //Create Todo
  GetPage(name: createTodoPageRoute, page: () => const TodoCreateSection()),


];
