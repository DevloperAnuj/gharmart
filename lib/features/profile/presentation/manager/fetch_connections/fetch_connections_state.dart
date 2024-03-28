part of 'fetch_connections_cubit.dart';

class FetchConnectionsState {

  final List<PropertyEntity> connectionList;

  const FetchConnectionsState({
    required this.connectionList,
  });

  factory FetchConnectionsState.initial(){
    return const FetchConnectionsState(connectionList: []);
  }

  FetchConnectionsState copyWith({
    List<PropertyEntity>? connectionList,
  }) {
    return FetchConnectionsState(
      connectionList: connectionList ?? this.connectionList,
    );
  }
}

