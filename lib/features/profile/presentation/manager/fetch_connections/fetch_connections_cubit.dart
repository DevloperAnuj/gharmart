import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_connections_state.dart';

class FetchConnectionsCubit extends Cubit<FetchConnectionsState> {
  FetchConnectionsCubit() : super(FetchConnectionsInitial());
}
