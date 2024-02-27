import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'panel_logic_state.dart';

class PanelLogicCubit extends Cubit<int> {
  PanelLogicCubit() : super(0);

  void toggleScreen(int i) {
    emit(i);
  }
}
