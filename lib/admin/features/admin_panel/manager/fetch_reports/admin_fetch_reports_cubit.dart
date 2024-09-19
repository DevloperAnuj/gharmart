import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:gharmart/admin/features/properties/report_property_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../features/home_listings/domain/entities/property_entity.dart';
import '../../../../../utils/config_file.dart';

part 'admin_fetch_reports_state.dart';

class AdminFetchReportsCubit extends Cubit<AdminFetchReportsState> {
  AdminFetchReportsCubit() : super(AdminFetchReportsState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  List<ReportPropertyEntity> tempReportedProperties = [];

  void fetchReports() async {
    try {
      final result = await client
          .from("report")
          .select('''*,property:property(*,user:users(*)),reporter:users(*)''').order(
              'created_at',
              ascending: false);
      final encodedBody = jsonEncode(result);
      Iterable decodedBody = jsonDecode(encodedBody);
      tempReportedProperties = decodedBody
          .map((property) => ReportPropertyEntity.fromMap(property))
          .toList();
      emit(state.copyWith(reportsList: tempReportedProperties));
    } on PostgrestException catch (e) {
      print(e.message);
    }
  }

  void takeActionOnReports(
      ReportPropertyEntity report,int status) async {
    try {
      if(status != report.property.status){
        await client
            .from('property')
            .update({'status': status}).eq("id", report.property.id);
      }
      await client.from('report').delete().eq('property', report.property.id);
      tempReportedProperties
          .removeWhere((element) => element.property.id == report.property.id);
      emit(state.copyWith(reportsList: tempReportedProperties));
      //TODO:ADD Function For Giving Token to Reporter
    } on PostgrestException catch (e) {
      emit(state.copyWith(reportsList: tempReportedProperties));
      throw e.message;
    }
  }

  void ignoreReport(String propertyId) async {
    try {
      await client.from('report').delete().eq('property', propertyId);
      tempReportedProperties
          .removeWhere((element) => element.property.id == propertyId);
      emit(state.copyWith(reportsList: tempReportedProperties));
    } on PostgrestException catch (e) {
      emit(state.copyWith(reportsList: tempReportedProperties));
      throw e.message;
    }
  }
}
