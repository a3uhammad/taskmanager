
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/user_controller.dart';
import 'routes.dart';
import 'themes/theme.dart';

void main() {
  Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.home,
      getPages: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
