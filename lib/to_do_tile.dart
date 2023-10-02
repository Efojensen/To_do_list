import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final bool isDone;
  final String task;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? delete;
  const ToDoTile({super.key, required this.isDone, required this.task, required this.onChanged, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(), children: [
              SlidableAction(onPressed: delete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              )
            ],
            ),
          child: Container(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Checkbox(
                      value: isDone, onChanged: onChanged
                    ),
                    Text(task)
                  ],
                ),
              )
            ),
        ),
      ),
    );
  }
}