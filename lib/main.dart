import 'package:cv/view/CV%20template/traditional_one.dart';
import 'package:flutter/material.dart';

import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   colorScheme:
      //       ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 36, 201)),
      //   useMaterial3: true,
      // ),
      home: HomePage(),
    );
  }
}
