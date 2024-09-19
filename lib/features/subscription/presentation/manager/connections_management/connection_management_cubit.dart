import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../utils/config_file.dart';

part 'connection_management_state.dart';

class ConnectionManagementCubit extends Cubit<int> {
  ConnectionManagementCubit() : super(0);

  final client = serviceConfig.get<SupabaseClient>();

  initConnections(int conn) {
    emit(conn);
  }

  void addConnections(int conn) {
    emit(conn);
  }

  void handleConnection(String id) {
    if (state > 0) {
      Future.delayed(const Duration(seconds: 1), () async {
        await client.from("users").update({"tokens": state - 1}).eq('id', id);
        emit(state - 1);
      });
    }
  }
}
