import 'package:flutter/material.dart';

class TextHeader1 extends StatelessWidget {
  final String text;
  const TextHeader1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.blueAccent, fontSize: 20, fontStyle: FontStyle.normal),
    );
  }
}
