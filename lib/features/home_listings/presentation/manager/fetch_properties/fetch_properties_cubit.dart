import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gharmart/features/home_listings/presentation/manager/display_properties/display_properties_cubit.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/entities/property_entity.dart';

part 'fetch_properties_state.dart';

class FetchPropertiesCubit extends Cubit<FetchPropertiesState> {
  FetchPropertiesCubit() : super(FetchPropertiesState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  void fetchProperties() async {
    try {
      final result =
          await client.from("property").select('''*,user:users(*)''');
      final encodedBody = jsonEncode(result);
      Iterable decodedBody = jsonDecode(encodedBody);
      emit(state.copyWith(
          properties: decodedBody
              .map((property) => PropertyEntity.fromMap(property))
              .toList()));
    } on PostgrestException catch (e) {
      emit(state.copyWith(properties: []));
    }
  }
}
