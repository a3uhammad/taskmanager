
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: Get.isDarkMode,
              onChanged: (val) {
                Get.changeTheme(val ? ThemeData.dark() : ThemeData.light());
              },
            ),
          ),
          // Add more settings options here
        ],
      ),
    );
  }
}
