import 'package:flutter/material.dart';
import 'package:to_do_list/buttons.dart';

class MyDialog extends StatelessWidget {
  final VoidCallback toDo;
  final TextEditingController controller;
  const MyDialog({super.key, required this.toDo, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
      color: Colors.white,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "New Task"
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(text: "Save", chosenColor: Colors.green, toDo: toDo),
              MyButton(text: "Cancel", chosenColor: Colors.red, toDo: Navigator.of(context).pop)
            ]
          )
        ]
      )
      ),
    );
  }
}