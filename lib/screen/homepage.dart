import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool varSementara = true;
  List<Todo> todos = dataTodo;

  @override
  Widget build(BuildContext context) {
    AppBar myAppbar = AppBar(
      title: const Text('Todo App'),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

//mendefinisikan area di hp tinggi dan lebar menyesuaikan dimensi masing2
    double heightBody = MediaQuery.of(context).size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    double widthBody = MediaQuery.of(context).size.width;

    //function search

    void searchTodo(String query) {
      final todoFilter = dataTodo.where((todo) {
        final todoTitle = todo.title.toLowerCase();
        final input = query.toLowerCase();
        return todoTitle.contains(input);
      }).toList();
      setState(() {
        todos = todoFilter;
      });
    }

// end Of definisi

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, "add_todo");
            },
            child: Icon(Icons.add)),
        appBar: myAppbar,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: widthBody,
              height: heightBody * 0.15,
              child: TextField(
                onChanged: searchTodo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Your Task',
                ),
              ),
              //color: Colors.amberAccent,
            ),
            todos.length != 0
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: heightBody * 0.85,
                    width: widthBody,
                    //color: Colors.amberAccent,

                    //**code awal menampilkan satu persatu
                    // child: CheckboxListTile(
                    //   secondary: Icon(
                    //     Icons.delete,
                    //     color: Colors.redAccent,
                    //   ),
                    //   controlAffinity: ListTileControlAffinity.leading,
                    //   title: const Text("Title"),
                    //   subtitle: const Text("Subtitle"),
                    //   value: varSementara,
                    //   onChanged: (value) {},
                    //**End Of tampilan satu persatu

                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: ((context, index) {
                        final todo = todos[index];
                        return CheckboxListTile(
                          // secondary: Icon(
                          //Icons.delete,
                          //color: Colors.redAccent,

                          secondary: IconButton(
                            onPressed: () {
                              setState(() {
                                todos.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete),
                            color: Colors.redAccent,
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            todo.title,
                            style: TextStyle(
                                fontSize: 18,
                                decoration: todo.isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                          subtitle: Text(todo.desc),
                          value: todo.isCompleted,
                          onChanged: (value) {
                            setState(() {
                              todo.isCompleted = value!;
                            });
                          },
                        );
                      }),
                    ),
                  )
                : Container(
                    child: Text("Data Kosong"),
                  ),
          ],
        )));
  }
}
