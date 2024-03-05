part of 'fetch_properties_cubit.dart';

class FetchPropertiesState {

  final List<PropertyEntity> properties;
  final bool? loading;
  final String? err;

  factory FetchPropertiesState.initial() {
    return const FetchPropertiesState(
      properties: <PropertyEntity>[],
    );
  }

  const FetchPropertiesState({
    required this.properties,
    this.loading,
    this.err,
  });

  FetchPropertiesState copyWith({
    List<PropertyEntity>? properties,
    bool? loading,
    String? err,
  }) {
    return FetchPropertiesState(
      properties: properties ?? this.properties,
      loading: loading ?? this.loading,
      err: err ?? this.err,
    );
  }
}
