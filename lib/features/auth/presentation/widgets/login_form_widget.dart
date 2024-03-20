import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/utils/constants.dart';

import '../manager/auth_toggle_cubit/auth_toggle_cubit.dart';
import '../manager/sign_in_cubit/sign_in_cubit.dart';
import 'my_auth_text_field.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Login",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black, fontSize: 45),
          ),
        ),
        MyAuthTextField(
          controller: emailController,
          hintText: "Email",
        ),
        MyAuthTextField(
          controller: passController,
          hintText: "Password",
          secured: true,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                context.read<SignInCubit>().loginWithEmailAndPass(
                      email: emailController.text,
                      pass: passController.text,
                    );
              },
              icon: BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInError) {
                    MyConstants.mySnackBar(
                      context,
                      message: state.err,
                      color: Colors.red,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SignInLoading) {
                    return const Icon(Icons.pending);
                  }
                  return const Icon(Icons.login);
                },
              ),
              label: const Text("Login"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<AuthToggleCubit>().toggleForm();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          child: const Text(
            "Don't Have an Account? Click Here Register",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
