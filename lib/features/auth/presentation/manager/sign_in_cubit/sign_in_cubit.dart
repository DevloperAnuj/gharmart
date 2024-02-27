import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  final client = serviceConfig.get<SupabaseClient>();

  void loginWithEmailAndPass({
    required String email,
    required String pass,
  }) async {
    try {
      emit(SignInLoading());
      await client.auth.signInWithPassword(
        password: pass,
        email: email,
      );
      emit(SignInSuccess());
    } on AuthException catch (e) {
      emit(SignInError(err: e.message));
    }
  }

  void logOut() async {
    await client.auth.signOut();
    emit(SignInInitial());
  }

}
