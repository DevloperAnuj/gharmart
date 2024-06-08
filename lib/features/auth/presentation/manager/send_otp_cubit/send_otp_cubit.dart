import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/config_file.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  SendOtpCubit() : super(SendOtpInitial());

  final client = serviceConfig.get<SupabaseClient>();

  void sendOtp(String email,bool signUp) async {
    try {
      emit(SendOtpLoading());
      await client.auth.signInWithOtp(email: email,shouldCreateUser: signUp);
      emit(SendOtpSuccess());
    } on AuthException catch (e) {
      emit(SendOtpFailed(err: e.message));
    }
  }

}
