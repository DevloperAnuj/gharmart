part of 'display_properties_cubit.dart';

class DisplayPropertiesState {

  final List<PropertyEntity> properties;

  const DisplayPropertiesState({
    required this.properties,
  });

  factory DisplayPropertiesState.initial(){
    return const DisplayPropertiesState(properties: []);
  }

  DisplayPropertiesState copyWith({
    List<PropertyEntity>? properties,
  }) {
    return DisplayPropertiesState(
      properties: properties ?? this.properties,
    );
  }
}

