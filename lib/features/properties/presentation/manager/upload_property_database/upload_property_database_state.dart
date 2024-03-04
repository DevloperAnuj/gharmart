part of 'upload_property_database_cubit.dart';

abstract class UploadPropertyDatabaseState extends Equatable {
  const UploadPropertyDatabaseState();
}

class UploadPropertyDatabaseInitial extends UploadPropertyDatabaseState {
  @override
  List<Object> get props => [];
}

class UploadPropertyDatabaseLoading extends UploadPropertyDatabaseState {
  @override
  List<Object> get props => [];
}

class UploadPropertyDatabaseSuccess extends UploadPropertyDatabaseState {
  @override
  List<Object> get props => [];
}

class UploadPropertyDatabaseFailed extends UploadPropertyDatabaseState {

  final String err;

  @override
  List<Object> get props => [err];

  const UploadPropertyDatabaseFailed({
    required this.err,
  });
}