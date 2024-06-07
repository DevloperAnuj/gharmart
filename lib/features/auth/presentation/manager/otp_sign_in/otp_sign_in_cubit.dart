import 'package:bloc/bloc.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'otp_sign_in_state.dart';

class OtpSignInCubit extends Cubit<OtpSignInState> {

  OtpSignInCubit() : super(OtpSignInInitial());

  final client = serviceConfig.get<SupabaseClient>();

  void sendOtp(String email) async {
    try {
      emit(OtpSignInLoading());
      await client.auth.signInWithOtp(email: email);
      emit(OtpSignInOtpSent());
    } on AuthException catch (e) {
      emit(OtpSignInOtpFail(err: e.message));
    }
  }

  void verifyOtp(String otp,String email) async {
    try {
      emit(OtpSignInLoading());
      await client.auth.verifyOTP(token: otp, type: OtpType.email,email: email);
      emit(OtpSignInSuccess());
    } on AuthException catch (e) {
      emit(OtpSignInFailed(err: e.message));
    }
  }
}
