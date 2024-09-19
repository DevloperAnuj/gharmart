import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../features/home_listings/domain/entities/property_entity.dart';
import '../../../../../utils/config_file.dart';

part 'fetch_admin_properties_state.dart';

class FetchAdminPropertiesCubit extends Cubit<FetchAdminPropertiesState> {
  FetchAdminPropertiesCubit() : super(FetchAdminPropertiesState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  List<PropertyEntity> allProperties = [];

  // List<PropertyEntity> pendingProperties = [];
  // List<PropertyEntity> approvedProperties = [];
  // List<PropertyEntity> delistProperties = [];
  // List<PropertyEntity> withheldProperties = [];

  void fetchProperties() async {
    try {
      final result =
          await client.from("property").select('''*,user:users(*)''').order('created_at',ascending: false);
      final encodedBody = jsonEncode(result);
      Iterable decodedBody = jsonDecode(encodedBody);
      allProperties = decodedBody
          .map((property) => PropertyEntity.fromMap(property))
          .toList();
      emit(
        state.copyWith(
          allProperties: decodedBody
              .map((property) => PropertyEntity.fromMap(property))
              .toList(),
          pendingProperties: allProperties.where((p) => p.status == 1).toList(),
          approvedProperties:
              allProperties.where((p) => p.status == 0).toList(),
          delistProperties: allProperties.where((p) => p.status == 3).toList(),
          withheldProperties:
              allProperties.where((p) => p.status == 2).toList(),
        ),
      );
    } on PostgrestException catch (e) {
      emit(FetchAdminPropertiesState.initial());
      throw e.message;
    }
  }

  void takingActionOnProperty(PropertyEntity property, int status) async {
    try {
      await client
          .from("property")
          .update({'status': status}).eq('id', property.id);
      allProperties.removeWhere((element) => element.id == property.id);
      allProperties.add(property.copyWith(status: status));
      emit(
        state.copyWith(
          allProperties: allProperties,
          pendingProperties: allProperties.where((p) => p.status == 1).toList(),
          approvedProperties:
              allProperties.where((p) => p.status == 0).toList(),
          delistProperties: allProperties.where((p) => p.status == 3).toList(),
          withheldProperties:
              allProperties.where((p) => p.status == 2).toList(),
        ),
      );
    } on PostgrestException catch (e) {
      throw e.message;
    }
  }
}
