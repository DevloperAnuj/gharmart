part of 'report_property_cubit.dart';

@immutable
abstract class ReportPropertyState {}

class ReportPropertyInitial extends ReportPropertyState {}

class ReportPropertyLoading extends ReportPropertyState {}

class ReportPropertySuccess extends ReportPropertyState {}

class ReportPropertyError extends ReportPropertyState {
  final String err;

  ReportPropertyError({
    required this.err,
  });
}
