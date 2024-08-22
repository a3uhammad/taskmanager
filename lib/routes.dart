
import 'package:get/get.dart';
import 'views/add_task_screen.dart';
import 'views/home_screen.dart';

class Routes {
  static final home = '/';
  static final addTask = '/addTask';

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: addTask, page: () => AddTaskScreen()),
  ];
}
