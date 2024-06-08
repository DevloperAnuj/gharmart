import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final SupabaseClient client = serviceConfig.get<SupabaseClient>();

  void signUpWithEmailOtp({
    required String name,
    required String email,
    required String phone,
    required String cityName,
    required String pass,
  }) async {
    try {
      emit(SignUpLoading());
      final AuthResponse result = await client.auth
          .verifyOTP(token: pass, type: OtpType.email, email: email);
      if (result.user != null) {
        await client.from("users").insert({
          "name": name,
          "phone": phone,
          "city": cityName,
          "email": email,
        });
        emit(SignUpSuccess());
      }
    } on AuthException catch (e) {
      emit(SignUpError(err: e.message));
    }
  }
}
