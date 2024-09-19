import 'package:bloc/bloc.dart';


class AdminPanelLogicCubit extends Cubit<int> {
  AdminPanelLogicCubit() : super(0);

  void togglePanel(int index){
    emit(index);
  }

}
