import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/auth/presentation/manager/auth_toggle_cubit/auth_toggle_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/otp_sign_in/otp_sign_in_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/send_otp_cubit/send_otp_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:gharmart/features/panel/presentation/sreens/profile_screen.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

import '../widgets/login_form_widget.dart';
import '../widgets/signup_form_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const String routeName = "/authpage";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthToggleCubit(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<SignUpCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<SignInCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<FetchProfileCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<OtpVerificationSignInCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<SendOtpCubit>(),
        ),
      ],
      child: const MyBuilder(
        mobileView: AuthPageMobile(),
        tabletView: AuthPageTablet(),
        deskView: AuthPageDesktop(),
      ),
    );
  }
}

class AuthPageMobile extends StatelessWidget {
  const AuthPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          margin: const EdgeInsets.all(20),
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.black),
          //   borderRadius: BorderRadius.circular(20),
          // ),
          child: SingleChildScrollView(
            child: BlocBuilder<AuthToggleCubit, bool>(
              builder: (context, state) {
                if (state) {
                  return const SignUpFormWidget();
                } else {
                  return const LoginFormWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AuthPageTablet extends StatelessWidget {
  const AuthPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.black),
            //   borderRadius: BorderRadius.circular(20),
            // ),
            child: SingleChildScrollView(
              child: BlocBuilder<AuthToggleCubit, bool>(
                builder: (context, state) {
                  if (state) {
                    return const SignUpFormWidget();
                  } else {
                    return const LoginFormWidget();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthPageDesktop extends StatelessWidget {
  const AuthPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: BlocBuilder<AuthToggleCubit, bool>(
                builder: (context, state) {
                  if (state) {
                    return const SignUpFormWidget();
                  } else {
                    return const LoginFormWidget();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
