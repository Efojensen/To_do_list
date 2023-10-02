import 'package:flutter/material.dart';
import 'package:to_do_list/dialog_box.dart';
import 'package:to_do_list/to_do_tile.dart';

void main(){
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

List toDoList = [];

class _MyAppState extends State<MyApp> {
  void checkBoxChanged(position){
    setState(() {
      toDoList[position][1] = !toDoList[position][1];
    });
  }

  final _controller = TextEditingController();

  void _addNewTask(){
    showDialog(
      context: context,
      builder:(context) {
        return MyDialog(
          toDo: (){
            setState(() {
              toDoList.add([_controller.text, false]);
            });
              Navigator.of(context).pop();
              _controller.clear();
          },
          controller: _controller);
      },
    );
  }

  void deleteToDo(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("T O  D O")
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: ((context, index) {
          return ToDoTile(
            isDone: toDoList[index][1],
            task: toDoList[index][0],
            onChanged: (value) => checkBoxChanged(index),
            delete: (context) => deleteToDo(index),
          );
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTask,
        child: const Icon(Icons.add)
      ),
    );
  }
}