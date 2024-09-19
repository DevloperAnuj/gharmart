part of 'fetch_property_by_id_cubit.dart';

class FetchPropertyByIdState {

  final PropertyEntity? propertyEntity;

  const FetchPropertyByIdState({
    this.propertyEntity,
  });

  factory FetchPropertyByIdState.initial() {
    return const FetchPropertyByIdState(propertyEntity: null);
  }

  FetchPropertyByIdState copyWith({
    PropertyEntity? propertyEntity,
  }) {
    return FetchPropertyByIdState(
      propertyEntity: propertyEntity ?? this.propertyEntity,
    );
  }
}
