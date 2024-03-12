part of 'get_user_properties_cubit.dart';

class GetUserPropertiesState {
  final List<PropertyEntity> properties;

  const GetUserPropertiesState({
    required this.properties,
  });

  factory GetUserPropertiesState.initial() {
    return const GetUserPropertiesState(properties: []);
  }

  GetUserPropertiesState copyWith({
    List<PropertyEntity>? properties,
  }) {
    return GetUserPropertiesState(
      properties: properties ?? this.properties,
    );
  }
}
