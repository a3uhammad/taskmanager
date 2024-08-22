
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/views/edit_profile_screen.dart';
import '../controller/task_controller.dart';
import '../controller/user_controller.dart';
import '../models/task.dart';
import '../routes.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final List<String> categories = ['All', 'Work', 'Personal', 'Shopping', 'Others'];
  var selectedCategory = 'All'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        actions: [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () {
              Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
          ),
          IconButton(onPressed: (){Get.to(EditProfileScreen());
         // Get.lazyPut(()=>UserController());
            }, icon: Icon(Icons.person))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return DropdownButton<String>(
                value: selectedCategory.value,
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    selectedCategory.value = value;
                  }
                },
              );
            }),
          ),
          Expanded(
            child: Obx(() {
              List<Task> filteredTasks = selectedCategory.value == 'All'
                  ? taskController.tasks
                  : taskController.tasks.where((task) => task.category == selectedCategory.value).toList();

              return ListView.builder(
                itemCount: filteredTasks.length,
                itemBuilder: (context, index) {
                  final task = filteredTasks[index];

                  return ListTile(
                    title: Text(
                      task.name,
                      style: TextStyle(
                        decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (task.description != null) Text(task.description!),
                        if (task.dueDate != null) Text('Due: ${task.dueDate}'),
                      ],
                    ),
                    trailing: Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) {
                        taskController.markTaskCompleted(index);
                      },
                    ),
                    onTap: () {
                      Get.to(
                            () => AddTaskScreen(
                          task: task,
                          index: taskController.tasks.indexOf(task),
                        ),
                      );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addTask);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
