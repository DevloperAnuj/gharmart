import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_toggle_state.dart';

class AuthToggleCubit extends Cubit<bool> {
  AuthToggleCubit() : super(false);

  void toggleForm() {
    emit(!state);
  }

}
