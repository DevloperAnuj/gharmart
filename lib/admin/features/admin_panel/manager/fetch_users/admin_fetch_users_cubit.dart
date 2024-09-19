import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../features/profile/domain/entities/profile_entity.dart';
import '../../../../../utils/config_file.dart';

part 'admin_fetch_users_state.dart';

class AdminFetchUsersCubit extends Cubit<AdminFetchUsersState> {
  AdminFetchUsersCubit() : super(AdminFetchUsersState.initial());

  final client = serviceConfig.get<SupabaseClient>();

  void fetchAllUsers() async {
    try {
      final result = await client.from("users").select().order('created_at',ascending: false);
      final encodedBody = jsonEncode(result);
      Iterable decodedBody = jsonDecode(encodedBody);
      emit(state.copyWith(
          allUsers: decodedBody
              .map((property) => ProfileEntity.fromMap(property))
              .toList()));
    } on PostgrestException catch (e) {
      emit(state.copyWith(allUsers: []));
      throw e.message;
    }
  }
}
