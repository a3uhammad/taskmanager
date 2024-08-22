
import 'package:get/get.dart';
import '../models/user.dart';

class UserController extends GetxController {
  var user = User(
    name: 'Abu Hammad',
    email: 'hammadabu2002@gmail.com',
    bio: 'Flutter Developer Who Loves To Build Mobile Application',
    profilePicture: 'https://variety.com/wp-content/uploads/2023/07/GettyImages-1511418315.jpg?w=1024', // Default profile picture
  ).obs;

  void updateUser(User updatedUser) {
    user.value = updatedUser;
    // Save user to persistent storage if needed
  }
}
