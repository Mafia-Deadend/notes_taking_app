import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List toDoList = [];

  //reference our box
  final _myBox = Hive.box("mybox");

  //run this method if this is the 1st time evert opening this app
  void createInitialData() {
    toDoList = [
      ["Make App", false],
      ["Do something", true]
    ];
  }

//load the data from the database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //update the database
  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
