part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState extends Equatable {}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoading extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => throw [];
}

class SignInSuccess extends SignInState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignInError extends SignInState {

  final String err;

  SignInError({
    required this.err,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [err];
}
