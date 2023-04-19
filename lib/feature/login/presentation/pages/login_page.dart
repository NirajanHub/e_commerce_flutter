import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/routes/routes_imports.gr.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/widgets/buttons.dart';
import 'package:e_commerce/core/widgets/text_widgets.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: (MediaQuery.of(context).size.width - 200),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextHeader1(
                    text: 'Login',
                  ),
                  const SizedBox(height: 50),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Email'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text('Password'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CommonButton(
                    myVoidCallback: () =>
                        {AutoRouter.of(context).push(const VideosRoute())},
                    text: 'Submit',
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
