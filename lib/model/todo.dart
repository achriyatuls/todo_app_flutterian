import 'package:flutter/cupertino.dart';

class Todo {
  final String id;
  final String title;
  final String desc;
  bool isCompleted;

  Todo(
      {required this.id,
      required this.title,
      required this.desc,
      this.isCompleted = false});
}

List<Todo> dataTodo = [
  Todo(id: DateTime.now().toString(), title: "Course", desc: "Flutterian"),
  Todo(id: DateTime.now().toString(), title: "Work", desc: "Mobile App"),
];
