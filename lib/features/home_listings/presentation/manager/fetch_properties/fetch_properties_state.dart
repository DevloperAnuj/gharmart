part of 'fetch_properties_cubit.dart';

class FetchPropertiesState {

  final List<PropertyEntity> properties;


  factory FetchPropertiesState.initial() {
    return const FetchPropertiesState(
      properties: <PropertyEntity>[],
    );
  }

  const FetchPropertiesState({
    required this.properties,
  });

  FetchPropertiesState copyWith({
    List<PropertyEntity>? properties,
  }) {
    return FetchPropertiesState(
      properties: properties ?? this.properties,
    );
  }
}
