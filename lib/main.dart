import 'package:flutter/material.dart';

// compile time constrant => const never change
// run time constrant => final change in runtime

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
    ));
  }
}
