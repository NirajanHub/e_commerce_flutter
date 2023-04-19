import 'package:auto_route/annotations.dart';
import 'package:e_commerce/core/widgets/buttons.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Videos extends StatelessWidget {
  const Videos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CommonButton(text: 'another page', myVoidCallback: () {})
      ]),
    );
  }
}
