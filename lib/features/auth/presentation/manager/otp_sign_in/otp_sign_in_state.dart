part of 'otp_sign_in_cubit.dart';

@immutable
sealed class OtpVerificationSignInState {}

final class OtpVerificationSignInInitial extends OtpVerificationSignInState {}


final class OtpVerificationSignInLoading extends OtpVerificationSignInState {}


final class OtpVerificationSignInSuccess extends OtpVerificationSignInState {}


final class OtpVerificationSignInFailed extends OtpVerificationSignInState {

  final String err;

  OtpVerificationSignInFailed({
    required this.err,
  });

}
