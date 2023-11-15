import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/src/configs/routes/routes.dart';

import 'src/configs/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      themeMode: ThemeMode.light,
      transitionDuration: const Duration(milliseconds: 1000),
      debugShowCheckedModeBanner: false,
      initialRoute: rootRoute,
      getPages: pages,
      builder: EasyLoading.init(),
    );
  }
}
