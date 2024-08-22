
class User {
  String name;
  String email;
  String bio;
  String profilePicture;

  User({
    required this.name,
    required this.email,
    required this.bio,
    required this.profilePicture,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'bio': bio,
      'profilePicture': profilePicture,
    };
  }


  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      bio: map['bio'],
      profilePicture: map['profilePicture'],
    );
  }
}
