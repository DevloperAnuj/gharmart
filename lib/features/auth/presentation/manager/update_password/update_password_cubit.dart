import 'package:bloc/bloc.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitial());

  final client = serviceConfig.get<SupabaseClient>();

  void updatePassword({required String email, required String password}) async {
    try {
      emit(UpdatePasswordLoading());
      await client.auth.updateUser(
        UserAttributes(
          email: email,
          password: password,
        ),
      );
      emit(UpdatePasswordLoading());
    } on AuthException catch (e) {
      emit(UpdatePasswordFailed(err: e.message));
    }
  }
}
