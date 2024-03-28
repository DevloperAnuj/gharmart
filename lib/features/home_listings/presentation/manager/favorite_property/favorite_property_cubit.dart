import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/entities/favorite_property_entity.dart';

part 'favorite_property_state.dart';

class FavoritePropertyCubit extends Cubit<FavoritePropertyState> {
  FavoritePropertyCubit() : super(FavoritePropertyState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  List<PropertyEntity> tempFavoritesProperties = [];
  List<String> tempFavoritesId = [];

  void fetchFavoriteProperties() async {
    if (client.auth.currentUser == null) {
      return;
    }
    final String userId = client.auth.currentUser!.id;
    try {
      final result = await client.from("favorites").select(
          '''*,property:property(*,user:users(*))''').eq("user", userId);
      final encodedBody = jsonEncode(result);
      Iterable decodedBody = jsonDecode(encodedBody);
      tempFavoritesProperties = decodedBody
          .map((property) => PropertyEntity.fromMap(property["property"]))
          .toList();
      emit(state.copyWith(favoritePropertyList: tempFavoritesProperties));
    } on PostgrestException catch (e) {
      print(e.message);
    }
  }

  void toggleFavorite(PropertyEntity property) async {
    final String userId = client.auth.currentUser!.id;
    try {
      if (tempFavoritesProperties.any((element) => element.id == property.id)) {
        await client
            .from('favorites')
            .delete()
            .eq('property', property.id)
            .eq("user", userId);
        tempFavoritesProperties
            .removeWhere((element) => element.id == property.id);
      } else {
        await client.from('favorites').insert({"property": property.id});
        tempFavoritesProperties.add(property);
      }
      emit(state.copyWith(favoritePropertyList: tempFavoritesProperties));
    } on PostgrestException catch (e) {
      print(e.message);
    }
  }
}
