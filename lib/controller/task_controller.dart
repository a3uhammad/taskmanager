
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks(); // Load tasks when the controller is initialized
  }

  void addTask(Task task) {
    tasks.add(task);
    _saveTasks();
  }

  void editTask(int index, Task updatedTask) {
    tasks[index] = updatedTask;
    _saveTasks();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    _saveTasks();
  }

  void markTaskCompleted(int index) {
    var task = tasks[index];
    tasks[index] = Task(
      name: task.name,
      description: task.description,
      category: task.category,
      isCompleted: !task.isCompleted,
      dueDate: task.dueDate,
    );
    _saveTasks();
  }

  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> taskStrings = tasks.map((task) => jsonEncode(task.toMap()))
        .toList();
    debugPrint("Saving tasks: $taskStrings");
    prefs.setStringList('tasks', taskStrings);
  }

  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? taskStrings = prefs.getStringList('tasks');
    if (taskStrings != null) {
      tasks.assignAll(
        taskStrings.map((str) => Task.fromMap(jsonDecode(str))).toList(),
      );
    }
  }
}
