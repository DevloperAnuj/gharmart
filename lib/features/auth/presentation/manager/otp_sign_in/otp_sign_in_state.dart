part of 'otp_sign_in_cubit.dart';

@immutable
sealed class OtpSignInState {}

final class OtpSignInInitial extends OtpSignInState {}


final class OtpSignInLoading extends OtpSignInState {}


final class OtpSignInOtpSent extends OtpSignInState {}


final class OtpSignInOtpFail extends OtpSignInState {
  final String err;

   OtpSignInOtpFail({
    required this.err,
  });
}


final class OtpSignInSuccess extends OtpSignInState {}


final class OtpSignInFailed extends OtpSignInState {

  final String err;

  OtpSignInFailed({
    required this.err,
  });

}
