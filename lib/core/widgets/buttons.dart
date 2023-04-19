import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback myVoidCallback;
  const CommonButton(
      {super.key, required this.text, required this.myVoidCallback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: myVoidCallback,
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text(text),
      ),
    );
  }
}
