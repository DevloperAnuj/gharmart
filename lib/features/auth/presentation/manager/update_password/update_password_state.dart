part of 'update_password_cubit.dart';

@immutable
sealed class UpdatePasswordState {}

final class UpdatePasswordInitial extends UpdatePasswordState {}

final class UpdatePasswordLoading extends UpdatePasswordState {}

final class UpdatePasswordSuccess extends UpdatePasswordState {}

final class UpdatePasswordFailed extends UpdatePasswordState {
  final String err;

   UpdatePasswordFailed({
    required this.err,
  });
}
