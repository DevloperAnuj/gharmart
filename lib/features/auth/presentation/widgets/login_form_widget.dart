import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/auth/presentation/widgets/reset_password_form.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
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
      mainAxisSize: MainAxisSize.min,
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
        MyAuthPassField(
          controller: passController,
          hintText: "Password",
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                validateFieldsAndLogin();
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
                  if (state is SignInSuccess) {
                    context.read<FetchProfileCubit>().fetchProfile();
                    Navigator.pop(context);
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
        OutlinedButton(
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
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ResetPasswordFormPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            child: const Text(
              "Reset Password",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  validateFieldsAndLogin() {
    if (emailController.text.isEmpty) {
      MyConstants.mySnackBar(context,
          message: "Email Can't Be Empty", color: Colors.amber);
      return;
    }
    if (passController.text.isEmpty || passController.text.length < 6) {
      MyConstants.mySnackBar(context,
          message: "Password Should be at least 6 Characters long",
          color: Colors.amber);
      return;
    }
    context.read<SignInCubit>().loginWithEmailAndPass(
          email: emailController.text,
          pass: passController.text,
        );
  }
}
