import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/filter/listing_filter_cubit.dart';
import 'package:gharmart/utils/config_file.dart';

import '../../../domain/entities/property_entity.dart';

part 'display_properties_state.dart';

class DisplayPropertiesCubit extends Cubit<DisplayPropertiesState> {
  DisplayPropertiesCubit() : super(DisplayPropertiesState.initial());

  final fetchedProperties = serviceConfig.get<FetchPropertiesCubit>();
  final filter = serviceConfig.get<ListingFilterCubit>();

  List<PropertyEntity> searchList = [];

  displayProperties() async {
    searchList = fetchedProperties.state.properties;
    emit(state.copyWith(properties: fetchedProperties.state.properties));
  }

  displayFilteredProperties() async {
    final List<PropertyEntity> list = fetchedProperties.state.properties
        .where(
          (property) =>
              property.propertyType == filter.state.propertyType &&
              property.country == filter.state.country &&
              property.city == filter.state.city &&
              property.state == filter.state.state &&
              property.bhkType == filter.state.bhkType &&
              property.parking == filter.state.parking &&
              property.prefTene == filter.state.prefTen &&
              property.furnishing == filter.state.furnishing &&
              (property.propertyType == "Rent"
                  ? property.rentPrice >= filter.state.rentMin
                  : property.sellPrice >= filter.state.priceMin) &&
              (property.propertyType == "Rent"
                  ? property.rentPrice <= filter.state.rentMax
                  : property.sellPrice <= filter.state.priceMax),
        )
        .toList();
    searchList = list;
    emit(state.copyWith(properties: list));
  }

  displayPropertiesBySearch(String searchText) {
    final list = searchList
        .where((property) =>
            property.title.toLowerCase().contains(searchText.toLowerCase()) ||
            property.address.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    emit(state.copyWith(properties: list));
  }
}
