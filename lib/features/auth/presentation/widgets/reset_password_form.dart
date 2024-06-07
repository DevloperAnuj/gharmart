import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:gharmart/utils/config_file.dart';

import '../../../../utils/constants.dart';
import 'my_auth_text_field.dart';

class ResetPasswordFormPage extends StatefulWidget {
  const ResetPasswordFormPage({super.key});

  @override
  State<ResetPasswordFormPage> createState() => _ResetPasswordFormPageState();
}

class _ResetPasswordFormPageState extends State<ResetPasswordFormPage> {

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Reset Password",
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
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (emailController.text.isEmpty) {
                            MyConstants.mySnackBar(context,
                                message: "Email Can't Be Empty", color: Colors.amber);
                            return;
                          }
                          context.read<ResetPasswordCubit>().sendVerification(
                            emailController.text,
                          );
                        },
                        icon: BlocConsumer<ResetPasswordCubit,
                            ResetPasswordState>(
                          listener: (context, state) {
                            if (state is ResetPasswordSuccess) {
                              MyConstants.mySnackBar(
                                context,
                                message:
                                    "Reset password Link Sent to Your Email.",
                                color: Colors.green,
                              );
                            }
                            if (state is ResetPasswordError) {
                              MyConstants.mySnackBar(
                                context,
                                message: state.err,
                                color: Colors.red,
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is ResetPasswordLoading) {
                              return const Icon(Icons.pending);
                            }
                            return const Icon(Icons.login);
                          },
                        ),
                        label: const Text("Send Reset Password Link"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
