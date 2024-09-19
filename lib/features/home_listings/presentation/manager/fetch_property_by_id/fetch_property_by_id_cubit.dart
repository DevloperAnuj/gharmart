import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/config_file.dart';

part 'fetch_property_by_id_state.dart';

class FetchPropertyByIdCubit extends Cubit<FetchPropertyByIdState> {
  FetchPropertyByIdCubit() : super(FetchPropertyByIdState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  void fetchPropertyById(String id) async {
    try {
      final result = await client
          .from("property")
          .select('''*,user:users(*)''')
          .eq("id", id)
          .single();
      final encodedBody = jsonEncode(result);
      emit(
        state.copyWith(propertyEntity: PropertyEntity.fromJson(encodedBody)),
      );
    } on PostgrestException catch (e) {
      print(e.message);
    }
  }
}
