import 'package:flutter/material.dart';

class h1 extends StatelessWidget {
  String head;

  h1({Key? key, required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      head,
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2),
    );
  }
}
