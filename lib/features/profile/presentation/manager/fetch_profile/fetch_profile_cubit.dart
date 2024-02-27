import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/profile/domain/entities/profile_entity.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

part 'fetch_profile_state.dart';

class FetchProfileCubit extends Cubit<FetchProfileState> {

  FetchProfileCubit() : super(FetchProfileInitial());

  final client = serviceConfig.get<SupabaseClient>();

  void fetchProfile() async {
    try {
      emit(FetchProfileLoading());
      final result = await client
          .from("users")
          .select()
          .eq('id', client.auth.currentUser!.id)
          .single();
      final encodedBody = jsonEncode(result);
      final decodedBody = jsonDecode(encodedBody);
      emit(
        FetchProfileSuccess(profileEntity: ProfileEntity.fromMap(decodedBody)),
      );
    } on PostgrestException catch (e) {
      emit(FetchProfileFailed(err: e.message));
    }
  }
}
