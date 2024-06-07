import 'package:bloc/bloc.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final client = serviceConfig.get<SupabaseClient>();

  void sendVerification(String email) async {
    try {
      emit(ResetPasswordLoading());
      await client.auth.resetPasswordForEmail(email);
      emit(ResetPasswordSuccess());
    } on AuthException catch (e) {
      emit(ResetPasswordError(err: e.message));
    }
  }
}
