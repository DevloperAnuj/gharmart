part of 'admin_fetch_reports_cubit.dart';

class AdminFetchReportsState {

  final List<ReportPropertyEntity> reportsList;

  const AdminFetchReportsState({
    required this.reportsList,
  });

  factory AdminFetchReportsState.initial(){
    return const AdminFetchReportsState(reportsList: []);
  }

  AdminFetchReportsState copyWith({
    List<ReportPropertyEntity>? reportsList,
  }) {
    return AdminFetchReportsState(
      reportsList: reportsList ?? this.reportsList,
    );
  }
}

