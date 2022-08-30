import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class AddTodo extends StatelessWidget {
  //class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);
  //AddTodoWidget createState() => AddTodoWidget();

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerTitle = TextEditingController();
    final TextEditingController controllerDesc = TextEditingController();

    // return Scaffold(
    AppBar myAppbar = AppBar(
      title: Text('Add Todo'),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

//mendefinisikan area di hp tinggi dan lebar menyesuaikan dimensi masing2
    double heightBody = MediaQuery.of(context).size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    double widthBody = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controllerTitle.text.length != 0 ||
              controllerDesc.text.length != 0) {
            dataTodo.add(Todo(
              id: DateTime.now().toString(),
              title: controllerTitle.text.length == 0
                  ? "No Title"
                  : controllerTitle.text,
              desc: controllerDesc.text.length == 0
                  ? "No Description"
                  : controllerDesc.text,
            ));
          }

          print(dataTodo);
          Navigator.pop(context);
        },
        child: Icon(Icons.add_task),
      ),
      appBar: myAppbar,
      body: Container(
        padding: EdgeInsets.all(10),
        width: widthBody,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: widthBody,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(255, 255, 255, 0.122)),
                child: TextField(
                  controller: controllerTitle,
                  maxLength: 20,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                      hintText: "Title",
                      fillColor: Colors.black,
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height: heightBody * 0.05),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white12),
                child: TextField(
                  controller: controllerDesc,
                  maxLines: 10,
                  //style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                      hintText: "Description",
                      fillColor: Colors.black,
                      border: InputBorder.none),
                ),
              ),
              //
            ],
          ),
        ),
      ),
      //uji
    );

    //uji
  }
}
