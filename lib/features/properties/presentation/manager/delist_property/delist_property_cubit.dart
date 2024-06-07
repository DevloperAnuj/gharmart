import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/constants.dart';

part 'delist_property_state.dart';

class DelistPropertyCubit extends Cubit<DelistPropertyState> {
  DelistPropertyCubit() : super(DelistPropertyInitial());

  final client = serviceConfig.get<SupabaseClient>();

  void delistCurrentProperty(String id) async {
    try {
      emit(DelistPropertyInitial());
      await client.from("property").update({'status': 3}).eq('id', id);
      emit(DelistPropertySuccess());
    } on StorageException catch (e) {
      emit(DelistPropertyFailed(err: e.message));
    }
  }

  void relistCurrentProperty(String id) async {
    try {
      emit(DelistPropertyInitial());
      await client.from("property").update({'status': 0}).eq('id', id);
      emit(DelistPropertySuccess());
    } on StorageException catch (e) {
      emit(DelistPropertyFailed(err: e.message));
    }
  }
}
