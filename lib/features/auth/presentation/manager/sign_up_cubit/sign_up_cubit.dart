import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final SupabaseClient client = serviceConfig.get<SupabaseClient>();

  void signUpWithEmailPass({
    required String name,
    required String email,
    required String phone,
    required String cityName,
    required String pass,
  }) async {
    try {
      emit(SignUpLoading());
      await client.auth.signUp(
        password: pass,
        email: email,
      );
      emit(SignUpSuccess());
      await client.from("users").insert({
        "name": name,
        "phone": phone,
        "city": cityName,
        "email": email,
      });
    } on AuthException catch (e) {
      emit(SignUpError(err: e.message));
    }
  }


}
