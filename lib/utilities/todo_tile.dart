// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final bool taskCompleted;
  final String taskName;
  final ValueChanged<bool?>? onChanged;
  Function(BuildContext)? deleteitem;

  TodoTile(
      {super.key,
      required this.taskCompleted,
      required this.onChanged,
      required this.taskName,
      required this.deleteitem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 7, bottom: 7),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteitem,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              //Task Name
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 60, 117, 251),
              borderRadius: BorderRadius.circular(9)),
        ),
      ),
    );
  }
}
