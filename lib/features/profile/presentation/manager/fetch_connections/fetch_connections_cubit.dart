import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/config_file.dart';
import '../../../../home_listings/domain/entities/property_entity.dart';
import '../../../domain/entities/connection_property_entity.dart';

part 'fetch_connections_state.dart';

class FetchConnectionsCubit extends Cubit<FetchConnectionsState> {

  FetchConnectionsCubit() : super(FetchConnectionsState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  List<PropertyEntity> tempConnectionProperties = [];

  void fetchConnectionsProperties() async {
    if (client.auth.currentUser == null) {
      return;
    }
    final String userId = client.auth.currentUser!.id;
    try {
      final result = await client.from("connections").select(
          '''*,property:property(*,user:users(*))''').eq("user", userId);
      final encodedBody = jsonEncode(result);
      Iterable decodedBody = jsonDecode(encodedBody);
      tempConnectionProperties = decodedBody
          .map((property) => PropertyEntity.fromMap(property["property"]))
          .toList();
      emit(state.copyWith(connectionList: tempConnectionProperties));
    } on PostgrestException catch (e) {
      print(e.message);
    }
  }

  void addToConnection(PropertyEntity property) async {
    try {
      if (tempConnectionProperties
          .any((element) => element.id == property.id)) {
        return null;
      } else {
        await client.from('connections').insert({"property": property.id});
        tempConnectionProperties.add(property);
      }
      emit(state.copyWith(connectionList: tempConnectionProperties));
    } on PostgrestException catch (e) {
      print(e.message);
    }
  }
}
