import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color chosenColor;
  final VoidCallback toDo;
  const MyButton({super.key, required this.text, required this.chosenColor, required this.toDo});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: toDo,
      color: chosenColor,
      child: Text(text),
    );
  }
}