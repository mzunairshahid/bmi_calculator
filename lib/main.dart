import 'package:bmi/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color.fromARGB(255, 39, 39, 39),
          primaryColor: Color.fromARGB(255, 39, 39, 39)),
      home: inputpage(),
    );
  }
}
