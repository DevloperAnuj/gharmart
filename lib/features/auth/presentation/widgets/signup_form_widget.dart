import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:gharmart/features/auth/presentation/widgets/reset_password_form.dart';
import 'package:gharmart/utils/constants.dart';

import '../../../profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import '../manager/auth_toggle_cubit/auth_toggle_cubit.dart';
import '../manager/send_otp_cubit/send_otp_cubit.dart';
import 'my_auth_text_field.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Register",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black, fontSize: 45),
          ),
        ),
        MyAuthTextField(
          controller: nameController,
          hintText: "Full Name",
        ),
        MyAuthTextField(
          controller: emailController,
          hintText: "Email",
        ),
        MyAuthTextField(
          controller: phoneController,
          hintText: "Phone",
        ),
        MyAuthTextField(
          controller: cityController,
          hintText: "City Name",
        ),
        if (context.watch<SendOtpCubit>().state is SendOtpSuccess)
          MyAuthPassField(
            controller: otpController,
            hintText: "OTP - 6 Digit",
          ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<SendOtpCubit, SendOtpState>(
            listener: (context, state) {
              if (state is SendOtpFailed) {
                MyConstants.mySnackBar(
                  context,
                  message: state.err,
                  color: Colors.red,
                );
              }
              if (state is SendOtpSuccess) {
                MyConstants.mySnackBar(
                  context,
                  message: "Otp Sent Successfully to Your Email",
                  color: Colors.green,
                );
              }
            },
            builder: (context, state) {
              if (state is SendOtpLoading) {
                return const CircularProgressIndicator();
              }
              if (state is SendOtpSuccess) {
                return const SizedBox();
              }
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    validateFieldsAndSendOtp();
                  },
                  icon: const Icon(Icons.email),
                  label: const Text("Send OTP"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
        if (context.watch<SendOtpCubit>().state is SendOtpSuccess)
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<SignUpCubit>().signUpWithEmailOtp(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        cityName: cityController.text,
                        pass: otpController.text,
                      );
                },
                icon: BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpError) {
                      MyConstants.mySnackBar(
                        context,
                        message: state.err,
                        color: Colors.red,
                      );
                    }
                    if (state is SignUpSuccess) {
                      context.read<FetchProfileCubit>().fetchProfile();
                      Navigator.of(context).pop();
                      MyConstants.mySnackBar(
                        context,
                        message: "User Register Successfully !!",
                        color: Colors.green,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SignUpLoading) {
                      return const Icon(Icons.pending);
                    }
                    return const Icon(Icons.app_registration);
                  },
                ),
                label: const Text("Register"),
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
            "Already Have an Account? Click Here Log In",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  validateFieldsAndSendOtp() {
    if (nameController.text.isEmpty) {
      MyConstants.mySnackBar(context,
          message: "Name Can't Be Empty", color: Colors.amber);
      return;
    }
    if (emailController.text.isEmpty) {
      MyConstants.mySnackBar(context,
          message: "Email Can't Be Empty", color: Colors.amber);
      return;
    }
    if (phoneController.text.isEmpty || phoneController.text.length != 10) {
      MyConstants.mySnackBar(context,
          message: "Phone Can't Validate it Should be 10 Characters long",
          color: Colors.amber);
      return;
    }
    if (cityController.text.isEmpty) {
      MyConstants.mySnackBar(context,
          message: "City Can't Be Empty", color: Colors.amber);
      return;
    }
    // if (otpController.text.isEmpty || otpController.text.length < 6) {
    //   MyConstants.mySnackBar(context,
    //       message: "Password Should be at least 6 Characters long",
    //       color: Colors.amber);
    //   return;
    // }
    context.read<SendOtpCubit>().sendOtp(
          emailController.text,
          true,
        );
  }
}
