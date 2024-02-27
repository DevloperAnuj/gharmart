import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_property_state.dart';

class AddPropertyTempCubit extends Cubit<AddPropertyTempState> {
  AddPropertyTempCubit() : super(AddPropertyTempState.initial());

  List<String> tempAmenities = [];
  List<Uint8List> tempImages = [];

  //
  void selectCountry(String val) {
    emit(state.copyWith(country: val));
  }

  void selectState(String val) {
    emit(state.copyWith(state: val));
  }

  void selectCity(String val) {
    emit(state.copyWith(city: val));
  }

  //
  void getTitle(String val) {
    emit(state.copyWith(title: val));
  }

  void getAddress(String val) {
    emit(state.copyWith(address: val));
  }

  //
  void togglePropertyType(String type) {
    emit(state.copyWith(propertyType: type));
  }

  //
  void getRent(int val) {
    emit(state.copyWith(rentPrice: val));
  }

  void setRentNego() {
    emit(state.copyWith(rentNego: !state.rentNego));
  }

  void getDeposit(int val) {
    emit(state.copyWith(deposit: val));
  }

  //
  void getSellPrice(int val) {
    emit(state.copyWith(sellPrice: val));
  }

  void setSellNego() {
    emit(state.copyWith(sellNego: !state.sellNego));
  }

  //
  void getMaintenance(int val) {
    emit(state.copyWith(ment: val));
  }

  //
  void getBhk(String val) {
    emit(state.copyWith(bhkType: val));
  }

  //
  void getBathrooms(int val) {
    emit(state.copyWith(bathNo: val));
  }

  void getBalconies(int val) {
    emit(state.copyWith(balkNo: val));
  }

  void getArea(int val) {
    emit(state.copyWith(area: val));
  }

  void getFloor(int val) {
    emit(state.copyWith(floorNo: val));
  }

  void getAge(int val) {
    emit(state.copyWith(age: val));
  }

  //
  void getFurnish(String val) {
    emit(state.copyWith(furnishing: val));
  }

  //
  void getTene(String val) {
    emit(state.copyWith(prefTene: val));
  }

  void getParking(String val) {
    emit(state.copyWith(parking: val));
  }

  void getWater(String val) {
    emit(state.copyWith(water: val));
  }

  void getFace(String val) {
    emit(state.copyWith(facing: val));
  }

  //
  void setSecu() {
    emit(state.copyWith(gatedSecu: !state.gatedSecu));
  }

  void setNonVeg() {
    emit(state.copyWith(nonveg: !state.nonveg));
  }

  //
  void imagesSection() {
    emit(state.copyWith(pics: tempImages));
  }

  //
  void addingAmenities(String val) {
    if (state.amenities.contains(val)) {
      tempAmenities.remove(val);
      emit(state.copyWith(amenities: tempAmenities));
    } else {
      tempAmenities.add(val);
      emit(state.copyWith(amenities: tempAmenities));
    }
  }

  void selectingImages() async {
    final List<XFile> result =
        await ImagePicker().pickMultiImage(imageQuality: 25);
    if (result.isNotEmpty) {
      for (XFile file in result) {
        tempImages.add(await file.readAsBytes());
      }
    }
    emit(state.copyWith(pics: tempImages));
  }

  void removingImage(int i) {
    if (tempImages.isNotEmpty) {
      tempImages.removeAt(i);
      emit(state.copyWith(pics: tempImages));
    }
  }
}
