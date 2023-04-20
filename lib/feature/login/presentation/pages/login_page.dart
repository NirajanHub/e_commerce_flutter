import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/feature/login/domain/usecases/login_usecase.dart';
import 'package:e_commerce/feature/login/presentation/bloc/cubit/login_cubit.dart';
import 'package:e_commerce/routes/routes_imports.gr.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/widgets/buttons.dart';
import 'package:e_commerce/core/widgets/text_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => sl<LoginCubit>(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: (MediaQuery.of(context).size.width - 200),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is AuthState) {
                          AutoRouter.of(context).push(const HomeRoute());
                        } else if (state is ErrorState) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Error'),
                            duration: Duration(milliseconds: 30),
                          ));
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const LoadingWidget();
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextHeader1(
                            text: 'Login',
                          ),
                          const SizedBox(height: 50),
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              label: Text('Email'),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text('Password'),
                            ),
                          ),
                          Builder(builder: (context) {
                            LoginRequest loginRequest = LoginRequest(
                                email: emailController.text,
                                password: passwordController.text);
                            return CommonButton(
                              myVoidCallback: () => {
                                BlocProvider.of<LoginCubit>(context)
                                    .login(loginRequest)
                              },
                              text: 'Submit',
                            );
                          }),
                        ],
                      ),
                    ),
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
