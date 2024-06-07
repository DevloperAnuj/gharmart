import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_sign_up_state.dart';

class OtpSignUpCubit extends Cubit<OtpSignUpState> {
  OtpSignUpCubit() : super(OtpSignUpInitial());
}
