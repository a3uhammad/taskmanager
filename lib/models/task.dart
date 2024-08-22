
class Task {
  String name;
  String? description;
  String category; // Add category field
  bool isCompleted;
  DateTime? dueDate;

  Task({
    required this.name,
    this.description,
    required this.category,
    this.isCompleted = false,
    this.dueDate,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'isCompleted': isCompleted,
      'dueDate': dueDate?.toIso8601String(),
    };
  }


  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      description: map['description'],
      category: map['category'],
      isCompleted: map['isCompleted'],
      dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null,
    );
  }
}
