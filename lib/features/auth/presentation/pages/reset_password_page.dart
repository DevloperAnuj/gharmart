import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/auth/presentation/manager/update_password/update_password_cubit.dart';

import '../../../../utils/constants.dart';
import '../widgets/my_auth_text_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  static const String routeName = "/resetpass";

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordCubit(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
                MyAuthTextField(
                  controller: passController,
                  hintText: "New Password",
                ),
                MyAuthTextField(
                  controller: confPassController,
                  hintText: "Confirm Password",
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child:
                        BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
                      listener: (context, state) {
                        if (state is UpdatePasswordSuccess) {
                          MyConstants.mySnackBar(
                            context,
                            message: "Password Changed Successfully",
                            color: Colors.green,
                          );
                        }
                        if (state is UpdatePasswordFailed) {
                          MyConstants.mySnackBar(
                            context,
                            message: "Password Changed Failed :${state.err}",
                            color: Colors.red,
                          );
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton.icon(
                          onPressed: () {
                            if (emailController.text.isEmpty) {
                              MyConstants.mySnackBar(context,
                                  message: "Email Can't Be Empty",
                                  color: Colors.amber);
                              return;
                            }
                            if (passController.text.length < 6) {
                              MyConstants.mySnackBar(context,
                                  message:
                                      "Password Length Can't Be less than 6",
                                  color: Colors.amber);
                              return;
                            }
                            if (passController.text !=
                                confPassController.text) {
                              MyConstants.mySnackBar(context,
                                  message:
                                      "Password and Confirm Password Should Same",
                                  color: Colors.amber);
                              return;
                            }
                            context.read<UpdatePasswordCubit>().updatePassword(
                                  email: emailController.text.trim(),
                                  password: passController.text,
                                );
                          },
                          icon: state is UpdatePasswordLoading
                              ? const Icon(Icons.pending)
                              : const Icon(Icons.key_outlined),
                          label: const Text("Set New Password"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
