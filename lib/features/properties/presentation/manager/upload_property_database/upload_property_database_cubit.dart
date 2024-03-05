import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/properties/presentation/manager/add_property_temp_cubit/add_property_cubit.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'upload_property_database_state.dart';

class UploadPropertyDatabaseCubit extends Cubit<UploadPropertyDatabaseState> {
  UploadPropertyDatabaseCubit() : super(UploadPropertyDatabaseInitial());

  final propertyTempCubit = serviceConfig.get<AddPropertyTempCubit>();
  final client = serviceConfig.get<SupabaseClient>();

  List<String> picsList = [];

  void uploadPropertyToDatabase(BuildContext context) async {
    try {
      if (validationCheck(context)) {
        emit(UploadPropertyDatabaseLoading());
        await uploadImagesGetUrl();
        uploadPropertyData();
        emit(UploadPropertyDatabaseSuccess());
      }
    } on StorageException catch (e) {
      emit(UploadPropertyDatabaseFailed(err: e.message));
    } on PostgrestException catch (e) {
      emit(UploadPropertyDatabaseFailed(err: e.message));
    }
  }

  Future<List<String>> uploadImagesGetUrl() async {
    try {
      final String uniqueFolder =
          DateTime.now().microsecondsSinceEpoch.toString();
      for (Uint8List img in propertyTempCubit.state.pics) {
        final imgName =
            "image-${Random().nextInt(10)}${Random().nextInt(10)}.jpeg";
        await client.storage.from("listings").uploadBinary(
              "$uniqueFolder/$imgName",
              img,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: false,
              ),
            );
        final imgUrl = client.storage
            .from("listings")
            .getPublicUrl("$uniqueFolder/$imgName");
        picsList.add(imgUrl);
      }
      return picsList;
    } on StorageException catch (e) {
      print(e);
      throw e.message;
    }
  }

  //
  bool validationCheck(BuildContext context) {
    if (propertyTempCubit.state.pics.isEmpty) {
      MyConstants.mySnackBar(
        context,
        message: "Please Select Images of Property",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.title.isEmpty) {
      MyConstants.mySnackBar(
        context,
        message: "Please Write Title of Property",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.address.isEmpty) {
      MyConstants.mySnackBar(
        context,
        message: "Please Write Address of Property",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.propertyType == "Property for") {
      MyConstants.mySnackBar(
        context,
        message: "Please Select Property Type",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.rentPrice == 0 &&
        propertyTempCubit.state.propertyType == "Rent") {
      MyConstants.mySnackBar(
        context,
        message: "Please Write Rent of Property",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.deposit == 0 &&
        propertyTempCubit.state.propertyType == "Rent") {
      MyConstants.mySnackBar(
        context,
        message: "Please Write Deposit of Property",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.sellPrice == 0 &&
        propertyTempCubit.state.propertyType == "Sell") {
      MyConstants.mySnackBar(
        context,
        message: "Please Write Selling Price of Property",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.ment == 0) {
      MyConstants.mySnackBar(
        context,
        message: "Please Write Maintenance Cost of Property",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.area == 0) {
      MyConstants.mySnackBar(
        context,
        message: "Please Write Area of Property in sqft",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.bhkType == "Select BHK") {
      MyConstants.mySnackBar(
        context,
        message: "Please Select Property BHK",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.furnishing == "Select Furnishing") {
      MyConstants.mySnackBar(
        context,
        message: "Please Select Property Furnishing",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.prefTene == "Preferred Tenets") {
      MyConstants.mySnackBar(
        context,
        message: "Please Select Property Preferred Tenets",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.parking == "Select Parking") {
      MyConstants.mySnackBar(
        context,
        message: "Please Select Property Parking",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.water == "Select Water Supply") {
      MyConstants.mySnackBar(
        context,
        message: "Please Select Property Water Supply",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.facing == "Select Home Facing") {
      MyConstants.mySnackBar(
        context,
        message: "Please Select Property Facing Direction",
        color: Colors.orange,
      );
      return false;
    }
    if (propertyTempCubit.state.age == 0) {
      MyConstants.mySnackBar(
        context,
        message: "Please Select Property Age in Years",
        color: Colors.orange,
      );
      return false;
    }
    return true;
  }

  //

  void uploadPropertyData() async {
    // print(
    //   jsonEncode(
    //     propertyTempCubit.state.copyWith(picsUrl: picsList, pics: []).toMap(),
    //   ),
    // );
    try {
      await client.from("property").insert(
            propertyTempCubit.state.copyWith(
              picsUrl: picsList,
              pics: [],
            ).toMap(),
          );
    } on PostgrestException catch (e) {
      print(e.message);
      rethrow;
    } finally {
      picsList.clear();
    }
  }
}
