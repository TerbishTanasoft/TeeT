// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/Answer.dart';
import 'playquiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Django Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }
}
