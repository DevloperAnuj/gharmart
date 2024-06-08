import 'package:bloc/bloc.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'otp_sign_in_state.dart';

class OtpVerificationSignInCubit extends Cubit<OtpVerificationSignInState> {

  OtpVerificationSignInCubit() : super(OtpVerificationSignInInitial());

  final client = serviceConfig.get<SupabaseClient>();

  void verifyOtp(String otp,String email) async {
    try {
      emit(OtpVerificationSignInLoading());
      await client.auth.verifyOTP(token: otp, type: OtpType.email,email: email);
      emit(OtpVerificationSignInSuccess());
    } on AuthException catch (e) {
      emit(OtpVerificationSignInFailed(err: e.message));
    }
  }
}
