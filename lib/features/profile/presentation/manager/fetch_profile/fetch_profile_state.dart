part of 'fetch_profile_cubit.dart';

@immutable
abstract class FetchProfileState {}

class FetchProfileInitial extends FetchProfileState {}

class FetchProfileLoading extends FetchProfileState {}

class FetchProfileSuccess extends FetchProfileState {

  final ProfileEntity profileEntity;

  FetchProfileSuccess({
    required this.profileEntity,
  });

  FetchProfileSuccess copyWith({
    ProfileEntity? profileEntity,
  }) {
    return FetchProfileSuccess(
      profileEntity: profileEntity ?? this.profileEntity,
    );
  }
}

class FetchProfileFailed extends FetchProfileState {

  final String err;

  FetchProfileFailed({
    required this.err,
  });

}
