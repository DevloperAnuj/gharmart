part of 'fetch_admin_properties_cubit.dart';

class FetchAdminPropertiesState {

  final List<PropertyEntity> allProperties ;
  final List<PropertyEntity> pendingProperties ;
  final List<PropertyEntity> approvedProperties ;
  final List<PropertyEntity> delistProperties;
  final List<PropertyEntity> withheldProperties;


  factory FetchAdminPropertiesState.initial() {
    return const FetchAdminPropertiesState(
      allProperties: <PropertyEntity>[],
      pendingProperties: <PropertyEntity>[],
      approvedProperties: <PropertyEntity>[],
      delistProperties: <PropertyEntity>[],
      withheldProperties: <PropertyEntity>[],
    );
  }

  const FetchAdminPropertiesState({
    required this.allProperties,
    required this.pendingProperties,
    required this.approvedProperties,
    required this.delistProperties,
    required this.withheldProperties,
  });

  FetchAdminPropertiesState copyWith({
    List<PropertyEntity>? allProperties,
    List<PropertyEntity>? pendingProperties,
    List<PropertyEntity>? approvedProperties,
    List<PropertyEntity>? delistProperties,
    List<PropertyEntity>? withheldProperties,
  }) {
    return FetchAdminPropertiesState(
      allProperties: allProperties ?? this.allProperties,
      pendingProperties: pendingProperties ?? this.pendingProperties,
      approvedProperties: approvedProperties ?? this.approvedProperties,
      delistProperties: delistProperties ?? this.delistProperties,
      withheldProperties: withheldProperties ?? this.withheldProperties,
    );
  }
}

