import 'package:calculator_project/strings_constants.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appName,
      
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const homePage(),
    );
  }
}

