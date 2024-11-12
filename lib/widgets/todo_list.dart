import 'dart:io';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      this.onChange,
      // required this.deleteFunction
      });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChange;
  // final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 20, bottom: 0, left: 20),

        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChange,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: const BorderSide(color: Colors.white),
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2.2,
                ),
              ),
            ],
          ),
        ),
      // ),
    );
  }
}
