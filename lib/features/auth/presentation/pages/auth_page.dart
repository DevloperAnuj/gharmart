import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/auth/presentation/manager/auth_toggle_cubit/auth_toggle_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
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
    return const Scaffold();
  }
}

class AuthPageTablet extends StatelessWidget {
  const AuthPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class AuthPageDesktop extends StatelessWidget {
  const AuthPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
        ],
      ),
    );
  }
}
