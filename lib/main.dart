// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:notes_taking_app/pages/homepage.dart';

Future<void> main() async {
  // Initialize Hive for Flutter
  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');

  box.put('name', 'Hammad');
  print('Name: ${box.get('name')}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 60, 117, 251),
          )),
      home: MyHomePage(),
    );
  }
}
