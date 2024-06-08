part of 'send_otp_cubit.dart';

@immutable
sealed class SendOtpState {}

final class SendOtpInitial extends SendOtpState {}

final class SendOtpLoading extends SendOtpState {}

final class SendOtpSuccess extends SendOtpState {}

final class SendOtpFailed extends SendOtpState {
  final String err;

   SendOtpFailed({
    required this.err,
  });
}
