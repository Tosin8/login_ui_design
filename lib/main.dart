import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: 'Flutter Login Ui', home: MyCustomLoginUI()));
}

class MyCustomLoginUI extends StatefulWidget {
  const MyCustomLoginUI({Key? key}) : super(key: key);

  @override
  State<MyCustomLoginUI> createState() => _MyCustomLoginUIState();
}

class _MyCustomLoginUIState extends State<MyCustomLoginUI> {
  @override
  Widget build(BuildContext context) {}
}
