
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final Task? task;
  final int? index;

  AddTaskScreen({this.task, this.index});

  final List<String> categories = ['Work', 'Personal', 'Shopping', 'Others'];
  String selectedCategory = 'Work';

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      nameController.text = task!.name;
      descriptionController.text = task!.description ?? '';
      selectedCategory = task!.category;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(task != null ? 'Edit Task' : 'Add Task'),
        actions: [
          if (task != null)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                taskController.deleteTask(index!);
                Get.back();
              },
            ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  selectedCategory = value;
                }
              },
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (task != null) {
                  taskController.editTask(index!, Task(
                    name: nameController.text,
                    description: descriptionController.text,
                    category: selectedCategory,
                    isCompleted: task!.isCompleted,
                    dueDate: task!.dueDate,
                  ));
                } else {
                  taskController.addTask(Task(
                    name: nameController.text,
                    description: descriptionController.text,
                    category: selectedCategory,
                  ));
                }
                Get.back();
              },
              child: Text(task != null ? 'Update Task' : 'Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
