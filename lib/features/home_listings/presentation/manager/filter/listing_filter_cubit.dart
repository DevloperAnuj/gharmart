import 'package:flutter_bloc/flutter_bloc.dart';

part 'listing_filter_state.dart';

class ListingFilterCubit extends Cubit<ListingFilterState> {
  ListingFilterCubit() : super(ListingFilterState.initial());

  applyCountry(String country) {
    emit(state.copyWith(country: country));
  }

  applyState(String mState) {
    emit(state.copyWith(state: mState));
  }

  applyCity(String city) {
    emit(state.copyWith(city: city));
  }

  applyPropertyType(String type) {
    emit(state.copyWith(propertyType: type));
  }

  applyBhkType(String bhk) {
    emit(state.copyWith(bhkType: bhk));
  }

  applyPropertyCat(String cat) {
    emit(state.copyWith(propertyCat: cat));
  }

  applyPrice(int min, int max) {
    emit(state.copyWith(priceMin: min, priceMax: max));
  }

  applyRent(int min, int max) {
    emit(state.copyWith(rentMin: min, rentMax: max));
  }

  applyPrefTent(String tenet) {
    emit(state.copyWith(prefTen: tenet));
  }

  applyFurnishing(String furnishing) {
    emit(state.copyWith(furnishing: furnishing));
  }

  applyParking(String parking) {
    emit(state.copyWith(parking: parking));
  }
}
