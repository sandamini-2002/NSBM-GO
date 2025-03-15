import 'package:flutter/material.dart';
import 'home.dart'; // Ensure this file exists

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'University App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Ensure HomePage() is correctly imported
    );
  }
}
