part of 'delist_property_cubit.dart';

@immutable
sealed class DelistPropertyState extends Equatable {}

class DelistPropertyInitial extends DelistPropertyState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DelistPropertySuccess extends DelistPropertyState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DelistPropertyFailed extends DelistPropertyState {
  final String err;

  DelistPropertyFailed({
    required this.err,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [err];
}