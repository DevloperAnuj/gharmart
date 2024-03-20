import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'connection_management_state.dart';

class ConnectionManagementCubit extends Cubit<int> {

  ConnectionManagementCubit() : super(0);

  initConnections(int conn) {
    emit(conn);
  }

  void addConnections(int conn) {
    emit(conn);
  }

  void handleConnection() {
    if (state > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        emit(state - 1);
      });
    }
  }
}
