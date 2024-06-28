// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_taking_app/Database/database.dart';
import 'package:notes_taking_app/utilities/dialog_box.dart';
import 'package:notes_taking_app/utilities/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Variables

  //database
  final _mybox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    super.initState();
    // if this is the first time ever open in the app the create default data
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  //controller
  final _controller = TextEditingController();

  // to do list
  List toDoList = [
    ["Make me", false],
    ["hello world", false],
  ];

//functions
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
    db.updateDatabase();
  }

  void savedNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller..clear();
      Navigator.of(context).pop();
    });
    db.updateDatabase();
  }

  //create a new tassk

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: savedNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    db.updateDatabase();
  }

//delete task
  void deletetask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

// User Interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 178, 245),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "TO DO",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskCompleted: toDoList[index][1],
            taskName: toDoList[index][0],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteitem: (context) => deletetask(index),
          );
        },
      ),
    );
  }
}
