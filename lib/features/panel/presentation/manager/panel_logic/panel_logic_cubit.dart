import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'panel_logic_state.dart';

class PanelLogicCubit extends Cubit<int> {
  PanelLogicCubit() : super(0);

  void toggleScreen(int i) {
    emit(i);
  }
}
