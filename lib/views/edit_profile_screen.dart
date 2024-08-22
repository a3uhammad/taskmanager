
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/views/settings_screen.dart';

import '../controller/user_controller.dart';
import '../models/user.dart';

class EditProfileScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  EditProfileScreen() {
    final user = userController.user.value;
    nameController.text = user.name;
    emailController.text = user.email;
    bioController.text = user.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(onPressed: (){Get.to(SettingsScreen());
          }, icon: Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle profile picture change
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(userController.user.value.profilePicture),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber, width: 4),
                    borderRadius: BorderRadius.circular(12),
                  ),),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber, width: 4),
                    borderRadius: BorderRadius.circular(12),
                  ),),
              ),
              SizedBox(height: 10),
              TextField(
                controller: bioController,
                decoration: InputDecoration(labelText: 'Bio',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.amber, width: 4),
                    borderRadius: BorderRadius.circular(12),
                  ),),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  userController.updateUser(User(
                    name: nameController.text,
                    email: emailController.text,
                    bio: bioController.text,
                    profilePicture: userController.user.value.profilePicture, // Keep the same picture for now
                  ));
                  Get.back();
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
