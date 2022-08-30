import 'package:flutter/material.dart';
import 'package:todo_app/screen/add_todo.dart';
import 'package:todo_app/screen/homepage.dart';
import 'package:todo_app/screen/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "Montserrat"),
      // ignore: prefer_const_constructors
      routes: {
        'homepage': (context) => HomePage(),
        'add_todo': (context) => AddTodo(),
        'test': (context) => CustomView(),
      },
      initialRoute: 'homepage',
    );
  }
}
