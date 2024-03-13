import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/config_file.dart';

part 'report_property_state.dart';

class ReportPropertyCubit extends Cubit<ReportPropertyState> {
  ReportPropertyCubit() : super(ReportPropertyInitial());

  final SupabaseClient client = serviceConfig.get<SupabaseClient>();

  void submitReport(String id, String reason) async {
    emit(ReportPropertyLoading());
    try {
      await client.from("report").insert({"property": id, "reason": reason});
      emit(ReportPropertySuccess());
    } on PostgrestException catch (e) {
      emit(ReportPropertyError(err: e.message));
    }
  }
}
