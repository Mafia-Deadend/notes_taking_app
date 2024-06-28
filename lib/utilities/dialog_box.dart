// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_taking_app/utilities/mybutton.dart';

class DialogBox extends StatelessWidget {
  DialogBox(
      {super.key,
      this.controller,
      required this.onSave,
      required this.onCancel});

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                Mybutton(text: "Cancel", onPressed: onCancel),
                // const SizedBox(
                //   width: 4,
                // ),
                //cancel button
                Mybutton(text: "Save", onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
