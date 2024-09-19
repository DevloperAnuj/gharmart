import 'package:csc_picker/csc_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/properties/presentation/manager/add_property_temp_cubit/add_property_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants.dart';
import '../manager/upload_property_database/upload_property_database_cubit.dart';
import '../pages/add_property_page.dart';

class AddPropertyForm extends StatelessWidget {
  const AddPropertyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<AddPropertyTempCubit, AddPropertyTempState>(
            builder: (context, tempState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: MyDropDown(
                      value: tempState.city,
                      onChanged: (val) {
                        context.read<AddPropertyTempCubit>().selectCity(val);
                      },
                      options: const ["Pune"],
                      iconData: Icons.my_location,
                    ),
                  ),
                  // AddPropertyTextFormField(
                  //   initialValue: tempState.title,
                  //   hint: "Title",
                  //   onChanged: (text) {
                  //     context.read<AddPropertyTempCubit>().getTitle(text);
                  //   },
                  // ),
                  AddPropertyTextFormField(
                    initialValue: tempState.address,
                    hint: "Address",
                    onChanged: (text) {
                      context.read<AddPropertyTempCubit>().getAddress(text);
                    },
                  ),
                  // AddPropertyTextFormField(
                  //   initialValue: tempState.desc,
                  //   hint: "Description",
                  //   max: 4,
                  //   onChanged: (text) {
                  //     context.read<AddPropertyTempCubit>().getDescription(text);
                  //   },
                  // ),
                  //Description Replaced with Landmark
                  // MyDropDown(
                  //   value: tempState.landmark,
                  //   onChanged: (val) {
                  //     context.read<AddPropertyTempCubit>().getLandmark(val);
                  //   },
                  //   options: landmarksPune,
                  //   iconData: Icons.location_on,
                  // ),
                  const SearchLandMarkDropDown(),
                  MyDropDown(
                    value: tempState.procat,
                    onChanged: (val) {
                      context.read<AddPropertyTempCubit>().getProcat(val);
                    },
                    options: const [
                      "Select Property Type",
                      'Room',
                      'Flat',
                      'Bungalow',
                      'Row House',
                      'Mansion',
                      'PG',
                    ],
                    iconData: Icons.category,
                  ),
                  MyDropDown(
                    value: tempState.propertyType,
                    onChanged: (val) {
                      context
                          .read<AddPropertyTempCubit>()
                          .togglePropertyType(val);
                    },
                    options: const ["Property for", "Rent", "Sell"],
                    iconData: Icons.key,
                  ),
                  if (tempState.propertyType == "Rent")
                    AddPropertyTextFormField(
                      initialValue: tempState.rentPrice.toString(),
                      inputType: TextInputType.number,
                      hint: "Rent in ₹",
                      onChanged: (rent) {
                        int price =
                            int.tryParse(rent) == null ? 0 : int.parse(rent);
                        context.read<AddPropertyTempCubit>().getRent(price);
                      },
                    ),
                  if (tempState.propertyType == "Rent")
                    CheckboxListTile(
                      value: tempState.rentNego,
                      onChanged: (val) {
                        context.read<AddPropertyTempCubit>().setRentNego();
                      },
                      title: const Text(
                        "Check Box if Rent Price is Negotiable",
                      ),
                    ),
                  if (tempState.propertyType == "Rent")
                    AddPropertyTextFormField(
                      initialValue: tempState.deposit.toString(),
                      inputType: TextInputType.number,
                      hint: "Deposit in ₹",
                      onChanged: (depo) {
                        int price =
                            int.tryParse(depo) == null ? 0 : int.parse(depo);
                        context.read<AddPropertyTempCubit>().getDeposit(price);
                      },
                    ),
                  if (tempState.propertyType == "Sell")
                    AddPropertyTextFormField(
                      initialValue: tempState.sellPrice.toString(),
                      inputType: TextInputType.number,
                      hint: "Sell Price in ₹",
                      onChanged: (sell) {
                        int price =
                            int.tryParse(sell) == null ? 0 : int.parse(sell);
                        context
                            .read<AddPropertyTempCubit>()
                            .getSellPrice(price);
                      },
                    ),
                  if (tempState.propertyType == "Sell")
                    CheckboxListTile(
                      title: const Text(
                        "Check Box if Selling Price is Negotiable",
                      ),
                      value: tempState.sellNego,
                      onChanged: (val) {
                        context.read<AddPropertyTempCubit>().setSellNego();
                      },
                    ),
                  AddPropertyTextFormField(
                    initialValue: tempState.ment.toString(),
                    inputType: TextInputType.number,
                    hint: "Maintenance in ₹",
                    onChanged: (ment) {
                      int price =
                          int.tryParse(ment) == null ? 0 : int.parse(ment);
                      context
                          .read<AddPropertyTempCubit>()
                          .getMaintenance(price);
                    },
                  ),
                  MyDropDown(
                    value: tempState.bhkType,
                    onChanged: (bhkVal) {
                      context.read<AddPropertyTempCubit>().getBhk(bhkVal);
                    },
                    options: const [
                      "Select BHK",
                      "1 RK",
                      "1 BHK",
                      "2 BHK",
                      "3 BHK",
                      "4 BHK",
                      "4+ BHK"
                    ],
                    iconData: Icons.apartment,
                  ),
                  AddPropertyTextFormField(
                    initialValue: tempState.bathNo.toString(),
                    inputType: TextInputType.number,
                    hint: "No of Bathrooms",
                    onChanged: (no) {
                      int price = int.tryParse(no) == null ? 0 : int.parse(no);
                      context.read<AddPropertyTempCubit>().getBathrooms(price);
                    },
                  ),
                  AddPropertyTextFormField(
                    initialValue: tempState.balkNo.toString(),
                    inputType: TextInputType.number,
                    hint: "No of Balconies",
                    onChanged: (no) {
                      int price = int.tryParse(no) == null ? 0 : int.parse(no);
                      context.read<AddPropertyTempCubit>().getBalconies(price);
                    },
                  ),
                  AddPropertyTextFormField(
                    initialValue: tempState.area.toString(),
                    inputType: TextInputType.number,
                    hint: "BuiltUp Area in sqft",
                    onChanged: (area) {
                      int price =
                          int.tryParse(area) == null ? 0 : int.parse(area);
                      context.read<AddPropertyTempCubit>().getArea(price);
                    },
                  ),
                  MyDropDown(
                    value: tempState.furnishing,
                    onChanged: (val) {
                      context.read<AddPropertyTempCubit>().getFurnish(val);
                    },
                    options: const [
                      "Select Furnishing",
                      "Semi",
                      "Full",
                      "None"
                    ],
                    iconData: Icons.chair,
                  ),
                  AddPropertyTextFormField(
                    initialValue: tempState.floorNo.toString(),
                    inputType: TextInputType.number,
                    hint: "Floor No",
                    onChanged: (floor) {
                      int price =
                          int.tryParse(floor) == null ? 0 : int.parse(floor);
                      context.read<AddPropertyTempCubit>().getFloor(price);
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text("Select Amenities"),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 10,
                      children: [
                        ChoiceChip(
                          label: const Text("Security"),
                          backgroundColor: Colors.grey.shade200,
                          selected: tempState.amenities.contains("Security"),
                          onSelected: (_) {
                            context
                                .read<AddPropertyTempCubit>()
                                .addingAmenities("Security");
                          },
                        ),
                        ChoiceChip(
                          label: const Text("Lift"),
                          backgroundColor: Colors.grey.shade200,
                          selected: tempState.amenities.contains("Lift"),
                          onSelected: (_) {
                            context
                                .read<AddPropertyTempCubit>()
                                .addingAmenities("Lift");
                          },
                        ),
                        ChoiceChip(
                          label: const Text("Power Backup"),
                          backgroundColor: Colors.grey.shade200,
                          selected:
                              tempState.amenities.contains("Power Backup"),
                          onSelected: (_) {
                            context
                                .read<AddPropertyTempCubit>()
                                .addingAmenities("Power Backup");
                          },
                        ),
                        ChoiceChip(
                          label: const Text("AC"),
                          backgroundColor: Colors.grey.shade200,
                          selected: tempState.amenities.contains("AC"),
                          onSelected: (_) {
                            context
                                .read<AddPropertyTempCubit>()
                                .addingAmenities("AC");
                          },
                        ),
                        ChoiceChip(
                          label: const Text("Club"),
                          backgroundColor: Colors.grey.shade200,
                          selected: tempState.amenities.contains("Club"),
                          onSelected: (_) {
                            context
                                .read<AddPropertyTempCubit>()
                                .addingAmenities("Club");
                          },
                        ),
                        ChoiceChip(
                          label: const Text("Gas"),
                          backgroundColor: Colors.grey.shade200,
                          selected: tempState.amenities.contains("Gas"),
                          onSelected: (_) {
                            context
                                .read<AddPropertyTempCubit>()
                                .addingAmenities("Gas");
                          },
                        ),
                        ChoiceChip(
                          label: const Text("Playground"),
                          backgroundColor: Colors.grey.shade200,
                          selected: tempState.amenities.contains("Playground"),
                          onSelected: (_) {
                            context
                                .read<AddPropertyTempCubit>()
                                .addingAmenities("Playground");
                          },
                        ),
                        ChoiceChip(
                          label: const Text("House Keeper"),
                          backgroundColor: Colors.grey.shade200,
                          selected:
                              tempState.amenities.contains("House Keeper"),
                          onSelected: (_) {
                            context
                                .read<AddPropertyTempCubit>()
                                .addingAmenities("House Keeper");
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyDropDown(
                    value: tempState.prefTene,
                    onChanged: (val) {
                      context.read<AddPropertyTempCubit>().getTene(val);
                    },
                    options: const [
                      "Preferred Tenets",
                      "All",
                      "Bachelor Female",
                      "Bachelor Male",
                      "Family"
                    ],
                    iconData: Icons.family_restroom,
                  ),
                  MyDropDown(
                    value: tempState.parking,
                    onChanged: (val) {
                      context.read<AddPropertyTempCubit>().getParking(val);
                    },
                    options: const [
                      "Select Parking",
                      "Bike",
                      "Car",
                      "Bike and Car",
                      "None"
                    ],
                    iconData: Icons.local_parking,
                  ),
                  MyDropDown(
                    value: tempState.water,
                    onChanged: (val) {
                      context.read<AddPropertyTempCubit>().getWater(val);
                    },
                    options: const [
                      "Select Water Supply",
                      "Municipal Corporation",
                      "Boring",
                      "Municipal Corporation and Boring",
                      "None"
                    ],
                    iconData: Icons.water_drop,
                  ),
                  MyDropDown(
                    value: tempState.facing,
                    onChanged: (val) {
                      context.read<AddPropertyTempCubit>().getFace(val);
                    },
                    options: const [
                      "Select Home Facing",
                      "North",
                      "East",
                      "West",
                      "South"
                    ],
                    iconData: Icons.directions,
                  ),
                  AddPropertyTextFormField(
                    initialValue: tempState.age.toString(),
                    inputType: TextInputType.number,
                    hint: "Property Age in Years",
                    onChanged: (age) {
                      int price =
                          int.tryParse(age) == null ? 0 : int.parse(age);
                      context.read<AddPropertyTempCubit>().getAge(price);
                    },
                  ),
                  CheckboxListTile(
                    title: const Text(
                      "Check Box if Gated Security is Available",
                    ),
                    value: tempState.gatedSecu,
                    onChanged: (val) {
                      context.read<AddPropertyTempCubit>().setSecu();
                    },
                  ),
                  CheckboxListTile(
                    title: const Text(
                      "Check Box if Non Veg is Allowed",
                    ),
                    value: tempState.nonveg,
                    onChanged: (val) {
                      context.read<AddPropertyTempCubit>().setNonVeg();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: BlocConsumer<UploadPropertyDatabaseCubit,
                        UploadPropertyDatabaseState>(
                      listener: (context, state) {
                        if (state is UploadPropertyDatabaseFailed) {
                          MyConstants.mySnackBar(
                            context,
                            message: state.err,
                            color: Colors.red,
                          );
                        }
                        if (state is UploadPropertyDatabaseSuccess) {
                          context.read<AddPropertyTempCubit>().setToInit();
                          MyConstants.mySnackBar(
                            context,
                            message: "Property Submitted For Review",
                            color: Colors.green,
                          );
                          Future.delayed(const Duration(seconds: 2), () {
                            context.pop();
                          });
                        }
                      },
                      builder: (context, state) {
                        if (state is UploadPropertyDatabaseLoading) {
                          return const CircularProgressIndicator();
                        }
                        return ElevatedButton.icon(
                          onPressed: () {
                            context
                                .read<UploadPropertyDatabaseCubit>()
                                .uploadPropertyToDatabase(context);
                          },
                          icon: const Icon(Icons.upload),
                          label: const Text("List Property"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class AddPropertyFormMobile extends StatelessWidget {
  const AddPropertyFormMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<AddPropertyTempCubit, AddPropertyTempState>(
        builder: (context, tempState) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: MyDropDown(
                  value: tempState.city,
                  onChanged: (val) {
                    context.read<AddPropertyTempCubit>().selectCity(val);
                  },
                  options: const ["Pune"],
                  iconData: Icons.my_location,
                ),
              ),
              AddPropertyTextFormField(
                initialValue: tempState.title,
                hint: "Title",
                onChanged: (text) {
                  context.read<AddPropertyTempCubit>().getTitle(text);
                },
              ),
              AddPropertyTextFormField(
                initialValue: tempState.address,
                hint: "Address",
                onChanged: (text) {
                  context.read<AddPropertyTempCubit>().getAddress(text);
                },
              ),
              // AddPropertyTextFormField(
              //   initialValue: tempState.desc,
              //   hint: "Description",
              //   max: 4,
              //   onChanged: (text) {
              //     context.read<AddPropertyTempCubit>().getDescription(text);
              //   },
              // ),
              const SearchLandMarkDropDown(),
              MyDropDown(
                value: tempState.landmark,
                onChanged: (val) {
                  context.read<AddPropertyTempCubit>().getLandmark(val);
                },
                options: landmarksPune,
                iconData: Icons.location_on,
              ),
              MyDropDown(
                value: tempState.procat,
                onChanged: (val) {
                  context.read<AddPropertyTempCubit>().getProcat(val);
                },
                options: const [
                  "Select Property Type",
                  'Room',
                  'Flat',
                  'Bungalow',
                  'Row House',
                  'Mansion',
                  'PG',
                ],
                iconData: Icons.category,
              ),
              MyDropDown(
                value: tempState.propertyType,
                onChanged: (val) {
                  context.read<AddPropertyTempCubit>().togglePropertyType(val);
                },
                options: const ["Property for", "Rent", "Sell"],
                iconData: Icons.key,
              ),
              if (tempState.propertyType == "Rent")
                AddPropertyTextFormField(
                  initialValue: tempState.rentPrice.toString(),
                  inputType: TextInputType.number,
                  hint: "Rent in ₹",
                  onChanged: (rent) {
                    int price =
                        int.tryParse(rent) == null ? 0 : int.parse(rent);
                    context.read<AddPropertyTempCubit>().getRent(price);
                  },
                ),
              if (tempState.propertyType == "Rent")
                CheckboxListTile(
                  value: tempState.rentNego,
                  onChanged: (val) {
                    context.read<AddPropertyTempCubit>().setRentNego();
                  },
                  title: const Text(
                    "Check Box if Rent Price is Negotiable",
                  ),
                ),
              if (tempState.propertyType == "Rent")
                AddPropertyTextFormField(
                  initialValue: tempState.deposit.toString(),
                  inputType: TextInputType.number,
                  hint: "Deposit in ₹",
                  onChanged: (depo) {
                    int price =
                        int.tryParse(depo) == null ? 0 : int.parse(depo);
                    context.read<AddPropertyTempCubit>().getDeposit(price);
                  },
                ),
              if (tempState.propertyType == "Sell")
                AddPropertyTextFormField(
                  initialValue: tempState.sellPrice.toString(),
                  inputType: TextInputType.number,
                  hint: "Sell Price in ₹",
                  onChanged: (sell) {
                    int price =
                        int.tryParse(sell) == null ? 0 : int.parse(sell);
                    context.read<AddPropertyTempCubit>().getSellPrice(price);
                  },
                ),
              if (tempState.propertyType == "Sell")
                CheckboxListTile(
                  title: const Text(
                    "Check Box if Selling Price is Negotiable",
                  ),
                  value: tempState.sellNego,
                  onChanged: (val) {
                    context.read<AddPropertyTempCubit>().setSellNego();
                  },
                ),
              AddPropertyTextFormField(
                initialValue: tempState.ment.toString(),
                inputType: TextInputType.number,
                hint: "Maintenance in ₹",
                onChanged: (ment) {
                  int price = int.tryParse(ment) == null ? 0 : int.parse(ment);
                  context.read<AddPropertyTempCubit>().getMaintenance(price);
                },
              ),
              MyDropDown(
                value: tempState.bhkType,
                onChanged: (bhkVal) {
                  context.read<AddPropertyTempCubit>().getBhk(bhkVal);
                },
                options: const [
                  "Select BHK",
                  "1 RK",
                  "1 BHK",
                  "2 BHK",
                  "3 BHK",
                  "4 BHK",
                  "4+ BHK"
                ],
                iconData: Icons.apartment,
              ),
              AddPropertyTextFormField(
                initialValue: tempState.bathNo.toString(),
                inputType: TextInputType.number,
                hint: "No of Bathrooms",
                onChanged: (no) {
                  int price = int.tryParse(no) == null ? 0 : int.parse(no);
                  context.read<AddPropertyTempCubit>().getBathrooms(price);
                },
              ),
              AddPropertyTextFormField(
                initialValue: tempState.balkNo.toString(),
                inputType: TextInputType.number,
                hint: "No of Balconies",
                onChanged: (no) {
                  int price = int.tryParse(no) == null ? 0 : int.parse(no);
                  context.read<AddPropertyTempCubit>().getBalconies(price);
                },
              ),
              AddPropertyTextFormField(
                initialValue: tempState.area.toString(),
                inputType: TextInputType.number,
                hint: "BuiltUp Area in sqft",
                onChanged: (area) {
                  int price = int.tryParse(area) == null ? 0 : int.parse(area);
                  context.read<AddPropertyTempCubit>().getArea(price);
                },
              ),
              MyDropDown(
                value: tempState.furnishing,
                onChanged: (val) {
                  context.read<AddPropertyTempCubit>().getFurnish(val);
                },
                options: const ["Select Furnishing", "Semi", "Full", "None"],
                iconData: Icons.chair,
              ),
              AddPropertyTextFormField(
                initialValue: tempState.floorNo.toString(),
                inputType: TextInputType.number,
                hint: "Floor No",
                onChanged: (floor) {
                  int price =
                      int.tryParse(floor) == null ? 0 : int.parse(floor);
                  context.read<AddPropertyTempCubit>().getFloor(price);
                },
              ),
              const SizedBox(height: 10),
              const Text("Select Amenities"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    ChoiceChip(
                      label: const Text("Security"),
                      backgroundColor: Colors.grey.shade200,
                      selected: tempState.amenities.contains("Security"),
                      onSelected: (_) {
                        context
                            .read<AddPropertyTempCubit>()
                            .addingAmenities("Security");
                      },
                    ),
                    ChoiceChip(
                      label: const Text("Lift"),
                      backgroundColor: Colors.grey.shade200,
                      selected: tempState.amenities.contains("Lift"),
                      onSelected: (_) {
                        context
                            .read<AddPropertyTempCubit>()
                            .addingAmenities("Lift");
                      },
                    ),
                    ChoiceChip(
                      label: const Text("Power Backup"),
                      backgroundColor: Colors.grey.shade200,
                      selected: tempState.amenities.contains("Power Backup"),
                      onSelected: (_) {
                        context
                            .read<AddPropertyTempCubit>()
                            .addingAmenities("Power Backup");
                      },
                    ),
                    ChoiceChip(
                      label: const Text("AC"),
                      backgroundColor: Colors.grey.shade200,
                      selected: tempState.amenities.contains("AC"),
                      onSelected: (_) {
                        context
                            .read<AddPropertyTempCubit>()
                            .addingAmenities("AC");
                      },
                    ),
                    ChoiceChip(
                      label: const Text("Club"),
                      backgroundColor: Colors.grey.shade200,
                      selected: tempState.amenities.contains("Club"),
                      onSelected: (_) {
                        context
                            .read<AddPropertyTempCubit>()
                            .addingAmenities("Club");
                      },
                    ),
                    ChoiceChip(
                      label: const Text("Gas"),
                      backgroundColor: Colors.grey.shade200,
                      selected: tempState.amenities.contains("Gas"),
                      onSelected: (_) {
                        context
                            .read<AddPropertyTempCubit>()
                            .addingAmenities("Gas");
                      },
                    ),
                    ChoiceChip(
                      label: const Text("Playground"),
                      backgroundColor: Colors.grey.shade200,
                      selected: tempState.amenities.contains("Playground"),
                      onSelected: (_) {
                        context
                            .read<AddPropertyTempCubit>()
                            .addingAmenities("Playground");
                      },
                    ),
                    ChoiceChip(
                      label: const Text("House Keeper"),
                      backgroundColor: Colors.grey.shade200,
                      selected: tempState.amenities.contains("House Keeper"),
                      onSelected: (_) {
                        context
                            .read<AddPropertyTempCubit>()
                            .addingAmenities("House Keeper");
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              MyDropDown(
                value: tempState.prefTene,
                onChanged: (val) {
                  context.read<AddPropertyTempCubit>().getTene(val);
                },
                options: const [
                  "Preferred Tenets",
                  "All",
                  "Bachelor Female",
                  "Bachelor Male",
                  "Family"
                ],
                iconData: Icons.family_restroom,
              ),
              MyDropDown(
                value: tempState.parking,
                onChanged: (val) {
                  context.read<AddPropertyTempCubit>().getParking(val);
                },
                options: const [
                  "Select Parking",
                  "Bike",
                  "Car",
                  "Bike and Car",
                  "None"
                ],
                iconData: Icons.local_parking,
              ),
              MyDropDown(
                value: tempState.water,
                onChanged: (val) {
                  context.read<AddPropertyTempCubit>().getWater(val);
                },
                options: const [
                  "Select Water Supply",
                  "Municipal Corporation",
                  "Boring",
                  "Municipal Corporation and Boring",
                  "None"
                ],
                iconData: Icons.water_drop,
              ),
              MyDropDown(
                value: tempState.facing,
                onChanged: (val) {
                  context.read<AddPropertyTempCubit>().getFace(val);
                },
                options: const [
                  "Select Home Facing",
                  "North",
                  "East",
                  "West",
                  "South"
                ],
                iconData: Icons.directions,
              ),
              AddPropertyTextFormField(
                initialValue: tempState.age.toString(),
                inputType: TextInputType.number,
                hint: "Property Age in Years",
                onChanged: (age) {
                  int price = int.tryParse(age) == null ? 0 : int.parse(age);
                  context.read<AddPropertyTempCubit>().getAge(price);
                },
              ),
              CheckboxListTile(
                title: const Text(
                  "Check Box if Gated Security is Available",
                ),
                value: tempState.gatedSecu,
                onChanged: (val) {
                  context.read<AddPropertyTempCubit>().setSecu();
                },
              ),
              CheckboxListTile(
                title: const Text(
                  "Check Box if Non Veg is Allowed",
                ),
                value: tempState.nonveg,
                onChanged: (val) {
                  context.read<AddPropertyTempCubit>().setNonVeg();
                },
              ),
              const AddPropertyToReviewButton(),
            ],
          );
        },
      ),
    );
  }
}

class MyDropDown extends StatelessWidget {
  final String value;
  final ValueChanged? onChanged;
  final List<String> options;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade50,
        ),
        child: Theme(
          data: ThemeData(),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: Icon(iconData),
              iconSize: 40,
              value: value,
              isExpanded: true,
              items: options
                  .map(
                    (option) => DropdownMenuItem<String>(
                      value: option,
                      alignment: Alignment.center,
                      child: Text(option),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }

  const MyDropDown({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
    this.iconData = Icons.arrow_drop_down_circle_rounded,
  });
}

class AddPropertyTextFormField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String initialValue;
  final String hint;
  final TextInputType inputType;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        initialValue: "",
        onChanged: onChanged,
        autofocus: false,
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: hint,
          border: InputBorder.none,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 3),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        keyboardType: max > 1 ? TextInputType.multiline : inputType,
        maxLines: max + 1,
        minLines: max,
      ),
    );
  }

  const AddPropertyTextFormField({
    super.key,
    this.onChanged,
    required this.initialValue,
    required this.hint,
    this.inputType = TextInputType.text,
    this.max = 1,
  });
}

final List<String> landmarksPune = [
  "Select Landmark",
  "Ambegaon Budruk",
  "Adarsh Nagar",
  "Adwait Nagar",
  "Airport Road",
  "Ajmera",
  "Akurdi",
  "Alandi",
  "Alandi Road",
  "Alandi-Markal Road",
  "Amanora",
  "Amanora Park Town",
  "Ambadvet",
  "Ambedkar Nagar",
  "Ambegaon",
  "Ambegaon Kh Part N V",
  "Ambegaon Pathar",
  "Anand Colony",
  "Anand Nagar",
  "Anand Vihar",
  "Anandpur",
  "Anna Bhai Matey Nagar",
  "Anna Bhau Sathe Nagar",
  "Anna Saheb Nagar",
  "Appa Balwant Chowk",
  "Apte Road",
  "Ashok Nagar",
  "Ashok Nagar Near Chandan Nagar",
  "Aswani Colony",
  "Aundh Dr Ambedkar Nagar",
  "Aundh Ganish Kheira",
  "Aundh Gaon",
  "Aundh Sadhu Vaswani Nagar",
  "Aundh Sakal Nagar",
  "Aundh Smt Kasturba Gandhi Vasahat",
  "Aundh Sonewadi",
  "Awhalwadi",
  "Baitangwadi",
  "Bajaj Industries",
  "Bajirao Road",
  "Balaji Nagar",
  "Balewadi",
  "Baner",
  "Baner - Mahalunge Road",
  "Baner Annex",
  "Baner Gaon",
  "Baner Pashan Link Road",
  "Baner Road",
  "Bapdev Nagar",
  "Bavadhan",
  "Bavdhan Khurd",
  "Belsar",
  "Bhandarkar Road",
  "Bharat Mata Nagar",
  "Bharati Vidyapeeth",
  "Bhawani Peth",
  "Bhekrai Nagar",
  "Bhilar Wada",
  "Bhimnagar Mundhwa",
  "Bhode Vasti",
  "Bhoirwadi",
  "Bhor",
  "Bhor Kapurhole Road",
  "Bhosale Village",
  "Bhosari",
  "Bhosari Adinath Nagar",
  "Bhosari Anand Industrial Area",
  "Bhosari District Centre",
  "Bhosari Gulve Vasti",
  "Bhosari Kendriya Vihar",
  "Bhosari MIDC",
  "Bhosari MIDC Sector 10",
  "Bhosari MIDC Sector 12",
  "Bhosari MIDC Sector 7",
  "Bhosari Ram Nagar",
  "Bhosari Sector 1",
  "Bhosari Sector 11",
  "Bhosari Sector 2",
  "Bhosari Sector 3",
  "Bhosari Sector 4",
  "Bhosari Sector 5",
  "Bhosari Sector 6",
  "Bhosari Sector 7",
  "Bhosari Sector 8",
  "Bhosari Sector 9",
  "Bhosari Shanti Nagar",
  "Bhosari Shantinagar Vasti",
  "Bhosari Shiv Ganesh Nagar",
  "Bhosle Nagar",
  "Bhugaon",
  "Bhukum",
  "Bhumkar Chowk Road",
  "Bhusari Colony",
  "Bibwewadi",
  "Bibwewadi Ashtavinayak Society",
  "Bibwewadi Bharat Jyoti Society",
  "Bibwewadi Vaibhav Society",
  "Boat Club Road",
  "Bope",
  "Bopkhel",
  "Bopodi",
  "Borate Vasti",
  "Budhwar Peth",
  "Bund Garden",
  "Burhani Colony",
  "Cantonment Residential Area",
  "Central Street Camp",
  "Chakan",
  "Chakrapani Nagar",
  "Chandan Nagar",
  "Chande",
  "Chande - Nande",
  "Chandkhed",
  "Charholi",
  "Chatushrungi Temple",
  "Chhatrapati Hs Society",
  "Chhatrapati Shivaji Nagar",
  "Chikhali",
  "Chimbali",
  "Chinchwad",
  "Chinchwad Anand Nagar",
  "Chinchwad Bhim Nagar",
  "Chinchwad Bhoirnagar",
  "Chinchwad Bohar Colony",
  "Chinchwad East",
  "Chinchwad Gawada Colony",
  "Chinchwad Indira Nagar",
  "Chinchwad Jeevan Nagar",
  "Chinchwad Kakde Township",
  "Chinchwad MIDC D3",
  "Chinchwad Manik Colony",
  "Chinchwad Morayaraj Park",
  "Chinchwad Premlok Park",
  "Chinchwad Queenstown",
  "Chinchwad Ruston Colony",
  "Chinchwad SKF Factory",
  "Chinchwad Shridhar Nagar",
  "Chinchwad Sonigara Township",
  "Chinchwad Sudarshan Nagar",
  "Chinchwad Tanaji Nagar",
  "Chinchwad Tata Motors",
  "Chintamani Nagar",
  "Chintamani Nagar Phase 1",
  "Chintamani Nagar Phase 2",
  "Chintamani Nagar Phase 3",
  "Chovisawadi",
  "Col Colony",
  "DI MIDC",
  "Dahanukar Colony",
  "Dalwi Nagar",
  "Dandekar Pool",
  "Dange Chowk Road",
  "Dapodi",
  "Dasar",
  "Datta Mandir Road",
  "Dattawadi",
  "Deccan",
  "Deccan Gymkhana",
  "Defence Area",
  "Dehu",
  "Dehu Alandi Road",
  "Dehu Road Area",
  "Dhanakwadi",
  "Dhanori",
  "Dhanori Amba Nagari",
  "Dhanori Bhairav Nagar",
  "Dhanori Darshan Nagar",
  "Dhanori Indira Nagar",
  "Dhanori Jai Prakash Nagar",
  "Dhanori Kheshe Park",
  "Dhanori Mohan Wadi",
  "Dhanori Tingre Nagar",
  "Dhanori Vidya Nagar",
  "Dhanori Vishrant Wadi",
  "Dhayri",
  "Dhole Patil Road",
  "Dighi",
  "Digvijay Colony",
  "Dudulgaon",
  "Durga Nagar",
  "Dutta Nagar",
  "ELPRO Industries Ltd",
  "East Street Road",
  "Eco Valley Kanhe Phata Old",
  "Ekbote Colony",
  "Erandwane",
  "F C Road",
  "Fatima Nagar",
  "Gandharw Farm",
  "Gandhi Nagar",
  "Ganesh Nagar",
  "Ganesh PethGanga Nagar",
  "Gangotri Nagar",
  "Ganj Peth",
  "Gaud Dhara",
  "Gawli Nagar",
  "Ghole Road",
  "Ghorpade Peth",
  "Ghorpadi",
  "Ghorpadi Empress Garden Society",
  "Ghorpadi Gaon",
  "Ghorpadi Nigade Nagar",
  "Ghorpadi Shreenath Nagar",
  "Gokhale Nagar",
  "Golibar Maidan",
  "Gopalpatti",
  "Guley Nagar",
  "Gultekadi",
  "Guru Nanak Nagar",
  "Guruwar Peth",
  "Gyaneswar Nagar",
  "Hadapsar",
  "Hadapsar Bhekrai Nagar",
  "Hadapsar Industrial Estate",
  "HAL",
  "HAL Staff Residencial Colony",
  "Handewadi",
  "Hanuman Nagar",
  "Happy Colony Hingne Khurd",
  "HDFC Colony",
  "Hinjawadi - Pirangut Road",
  "Hinjewadi",
  "Hinjewadi Rajiv Gandhi Infotech Park Pha...",
  "IITM Colony",
  "Indira Shankar Nagari",
  "Indraprastha Society",
  "Jambe",
  "Janawadi",
  "Jangli Maharaj Road",
  "Janta Nagar",
  "Janta Vasahat",
  "Jeevan Vihar",
  "Jijamata Park",
  "JJC Bithal Nagar",
  "JM Road",
  "Juna Bazaar",
  "Jyotiba Nagar",
  "Kailas Nagar",
  "Kalbhor Nagar",
  "Kalewadi Vinay Nagar",
  "Kalyani Nagar",
  "Kamshet",
  "Kamthe Patil Nagar",
  "Kanhe Phata",
  "Kanjale",
  "Kapurhol",
  "Karve Nagar",
  "Kasara",
  "Kasarsai",
  "Kasarwadi",
  "Kasba peth",
  "Kashi Wadi",
  "Kasurdi",
  "Katey Basti",
  "Katraj",
  "Katraj Kondhwa Road",
  "Kattraj",
  "Katvi",
  "Kedari Nagar",
  "Kelawade",
  "Keshav Nagar",
  "Kesnand",
  "Khadakwasla",
  "Khadki",
  "Khadki Jai Jawan Nagar",
  "Khaire Basti",
  "Kharadi",
  "Kharalwadi",
  "Khed Shivapur",
  "Khopi",
  "Khule Wadi",
  "Kirkee",
  "Kirkitwadi",
  "Kiwale",
  "Kolambhi",
  "Kolwadi",
  "Kondhawe Dhawade",
  "Kondhwa",
  "Kondhwa Khurd",
  "Kopre",
  "Koregaon Bhima",
  "Koregaon park",
  "Koregaon Park Extension",
  "Koregaon Park Ragvilas Society",
  "Kothrud",
  "Kothrud Dahanukar Colony",
  "Kothrud Mahatma Housing Society",
  "Kothrud Mayur Colony",
  "Kothrud Paschima Nagri",
  "Kothrud Pramathes Society",
  "Koyana Nagar",
  "Koyer Basti",
  "Krishi Mahavidyalaya",
  "Krishna Nagar",
  "Kubera Colony",
  "Kudalwadi Chikhli",
  "Kunal Icon",
  "Kunal Puram",
  "Kunjirwadi-Uruli Kanchan Rd",
  "Laltopi Nagar Morwadi",
  "Landge Vasti",
  "Lavale",
  "Law College",
  "Laxmi Kund",
  "Laxmi Nagar",
  "Lohegaon",
  "Lohegaon Laxmi Nagar",
  "Lohegaon Puri",
  "Lohegaon Sai Nagar",
  "Lohiya Nagar",
  "Lokmany Nagar",
  "Lokmanya Colony",
  "Loni Kalbhor",
  "Lonikand",
  "Lulla Nagar",
  "Lumbini nagar",
  "Maan",
  "Madhuban Colony",
  "Magarpatta City",
  "Mahadev Nagar",
  "Mahalunge",
  "Maharshi Nagar",
  "Mahatma Phule Nagar Near Pandav Nagar",
  "Mahaveer Nagar",
  "Mahesh Nagar",
  "Malinagar",
  "Malwadi",
  "Mamurdi",
  "Man",
  "Manchar",
  "Mangalwar Peth",
  "Manjari",
  "Manjari Road Village",
  "Manjri Khurd",
  "Markal",
  "Market Yard",
  "Marunji",
  "Mayur Colony",
  "MG Road",
  "Mhalaskar Wadi",
  "MIDC",
  "Milind Nagar",
  "Military Residential Area",
  "Mitra Mandal Colony",
  "Model Colony",
  "Modi Colony",
  "Mohammad Wadi",
  "Moraya Vasti",
  "Morgaon",
  "Morwadi",
  "Moshi",
  "Mukund Nagar",
  "Mukund Nagar Chandra Nagar Society",
  "Mulsi",
  "Mundhwa",
  "Mundhwa Pingale Wasti",
  "Nageshwar Nagar",
  "Nagpur Chal",
  "Naigaon Peth-Uruli Kanchan Rd",
  "Nana Peth",
  "Nande",
  "Nanded",
  "Nanded City",
  "Nandoshi",
  "Narayan Peth",
  "Narayangaon",
  "Narayanpur",
  "Narhe",
  "Narhe Industrial Area",
  "Nasarapur",
  "Nata Ramai Chowk",
  "Navi peth",
  "Naygaon",
  "Nehru Nagar",
  "Nerhe",
  "Netaji Nagar",
  "New Modikhana",
  "New Sadashiv Peth",
  "New Sangvi",
  "NIBM",
  "NIBM Mohammadwadi Road",
  "NIBM Road Kondhwa",
  "Nigdi",
  "Nigdi Pradhikaran",
  "Nigdi Sai Nath Nagar",
  "Nigdi Sector 26",
  "Nigdi Swami Samarth Nagar",
  "Nigdi Yamuna Nagar",
  "Nigdi Yamuna Nagar Sector 21",
  "Niwas Colony",
  "Old Sangvi",
  "P&T Colony",
  "Padamavati Chowk",
  "Padmadarshan Society Satara Road",
  "Padmavati",
  "Pali",
  "Pallod Farms",
  "Panchawati",
  "Pandav Nagar",
  "Panjab Bank Colony",
  "Panmala",
  "Paras Nesh Colony",
  "Parvati",
  "Parvati Hill",
  "Parvati MHB Colony",
  "Parvati Tapodhan Society",
  "Pashan",
  "Patil Nagar",
  "Paud",
  "Pawana Nagar",
  "Pawar Vasti",
  "Perne Phata-Koregaon Bhima Rd",
  "Phule Nagar",
  "Phursungi",
  "Pimple Gurav",
  "Pimple Gurav Gangarde Nagar",
  "Pimple Nilakh",
  "Pimple Saudagar",
  "Pimpri",
  "Pimpri Buddha Nagar",
  "Pimpri Chinchwad",
  "Pimpri DII MIDC",
  "Pimpri Saudagar",
  "Pirangut",
  "Pisoli",
  "Police Colony",
  "Prabhat Road",
  "Pradhikaran Nigdi Sector 24",
  "Pradhikaran Nigdi Sector 25",
  "Pradhikaran Nigdi Sector 27",
  "Pradhikaran Nigdi Sector 27A",
  "Pradhikaran Nigdi Sector 28",
  "Pradhikaran Nigdi Sector 29",
  "Pratik Nagar",
  "Prem Nagar",
  "Punawale",
  "Pune Cantonment",
  "Pune Satara- Shindewadi Highway",
  "Pune Vidyapith",
  "Purana Nagar",
  "Rahatni",
  "Raj Nagar",
  "Rajendra Nagar",
  "Rajey Sivaji Nagar",
  "Rajgurunagar",
  "Rajiv Gandhi Jhopadpatti",
  "Rajiv Gandhi Nagar",
  "Rakh",
  "Rakshak Nagar",
  "Ram Nagar",
  "Ramdas Nagar",
  "Ramnagar Colony",
  "Ramtekdi",
  "Ramtekdi Industrial Area",
  "Range Hills",
  "Rasta Peth",
  "Ravet",
  "Raviwar Peth",
  "Renuka Nagar",
  "Revenue Colony",
  "Rihe",
  "Roseland",
  "Rupee Nagar",
  "Sadashiv Peth",
  "Sagar Society",
  "Sahakar Colony",
  "Sahakar Nagar",
  "Sahakar Nagar II",
  "Sahayog Nagar",
  "Salisbury Park",
  "Salunke Vihar",
  "Samarth Nagar",
  "Sambhaji Nagar",
  "Sanaswadi",
  "Sangamvadi Atur Park",
  "Sangamwadi",
  "Sangavade",
  "Sanjay Park",
  "Sant Nagar",
  "Sant Tukaram Nagar",
  "Santosh Nagar",
  "Sarasbaug",
  "Sarita Vihar",
  "Sasane Nagar",
  "Saswad Road",
  "Satara Road, Balajinagar",
  "Satavwadi",
  "Satyapuram",
  "Sayad Nagar",
  "Sayyed Nagar",
  "Secret Heart Town",
  "Sector 18 Shivtej Nagar",
  "Sector 23",
  "Senapati Bapat Road",
  "Seva Nagar",
  "Shahu Colony",
  "Shahu Nagar",
  "Shaniwar Peth",
  "Shankar Nagar",
  "Shanti Kunj",
  "Shanti Nagar",
  "Sharad nagar",
  "Sharmik Nagar",
  "Shastri Nagar",
  "Shinde Vasti",
  "Shiv Dutt Colony",
  "Shiv Nagar",
  "Shiv Shankar Nagar",
  "Shivaji Nagar",
  "Shivaji Park",
  "Shivane",
  "Shivare",
  "Shivne Part N V",
  "Shivtej Nagar",
  "Shoyange Nagar",
  "Shravasti Nagar",
  "Shree Agrasen Maharaj Chowk",
  "Shree Nagar",
  "Shri Shrungeri Shankar Math Colony",
  "Shukrawar Peth",
  "Siddarth Nagar",
  "Siddharth Nagar",
  "Siddheshwar Nagar",
  "Sinhagad Road",
  "Solapur",
  "Somatne",
  "Somwar Peth",
  "Sopan Baug",
  "SP Infocity",
  "SRPF Area",
  "Sudarshan Nagar",
  "Sun Vihar",
  "Sunarwadi",
  "SUS",
  "Sus N V",
  "Sutarwadi",
  "Swami Vivekanand Nagar",
  "Swargate",
  "Swatantrya Sainik Nagar",
  "Taladey Phuley Nagar",
  "Talegaon",
  "Talegaon Dabhade",
  "Talegaon Dhamdhere",
  "Talwade",
  "Tamhini",
  "Tapkir Nagar",
  "Tapmor Nagar",
  "Tata Motors",
  "Tata Motors Residential Area",
  "Tathawade",
  "Telco Industries Area",
  "Thergaon",
  "Thergaon Belthika Nagar",
  "Thergaon Ganesh Nagar",
  "Thergaon Mangal Nagar",
  "Thergaon Shree Krishna Colony",
  "Theur",
  "Tingre Nagar",
  "Tirmurti Nagar",
  "Tirmurti Vihar",
  "Tirveni Nagar",
  "TMV Nagar",
  "Tukaya Nagar",
  "Tulapur",
  "Undri",
  "Urawade",
  "Urse",
  "Uruli Devachi",
  "Uruli Kanchan",
  "Uttamnagar",
  "Vadgaon",
  "Vadgaon Budruk",
  "Vadu Road-Koregaon Bhima Rd",
  "Vaibhav Nagar",
  "Valmiki Vasti",
  "Varsha park",
  "Varve Budruk",
  "Varve Khurd",
  "Ved Vihar",
  "Veerbhadra Nagar",
  "Velhe",
  "Velu",
  "Vidya Nagar",
  "Vijay Nagar Colony",
  "Vikas Nagar",
  "Viman Nagar",
  "Viman Nagar Rajiv Nagar",
  "Viman Nagar Road",
  "Viman Nagar Slum",
  "Vishal Nagar",
  "Vishrant Wadi",
  "Vithalwadi",
  "Wadachi Wadi",
  "Wadar Wadi",
  "Wadebolai",
  "Wadgaon Sheri",
  "Wadgaon Sheri Ramawadi",
  "Wadgaon Sheri Sainath Nagar",
  "Wadgaon Shinde",
  "Wadia College Area",
  "Wadki",
  "Wadmukhwadi",
  "Wagholi",
  "Wagholi Ubale Nagar",
  "Wakad",
  "Wakad Police Lines",
  "Wakadewadi",
  "Walhekarwadi",
  "Walvekar Nagar",
  "Wanowrie",
  "Wanwadi",
  "Warje",
  "Windmill Village",
  "Yashwant Nagar",
  "Yerwada",
  "Yewalewadi",
];

class SearchLandMarkDropDown extends StatefulWidget {
  const SearchLandMarkDropDown({super.key});

  @override
  State<SearchLandMarkDropDown> createState() => _SearchLandMarkDropDownState();
}

class _SearchLandMarkDropDownState extends State<SearchLandMarkDropDown> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Theme(
        data: ThemeData(),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            iconStyleData: const IconStyleData(icon: Icon(null)),
            style: const TextStyle(color: Colors.black, fontSize: 25),
            items: landmarksPune
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: context.watch<AddPropertyTempCubit>().state.landmark,
            onChanged: (value) {
              if (value != null) {
                context.read<AddPropertyTempCubit>().getLandmark(value);
              }
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
            ),
            dropdownStyleData: const DropdownStyleData(
              decoration: BoxDecoration(),
              maxHeight: 200,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
            dropdownSearchData: DropdownSearchData(
              searchController: textEditingController,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Container(
                height: 50,
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: TextFormField(
                  maxLines: null,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: 'Search for an Landmark...',
                    hintStyle:
                        const TextStyle(fontSize: 12, color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white)),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return item.value
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
              },
            ),
            //This to clear the search value when you close the menu
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                textEditingController.clear();
              }
            },
          ),
        ),
      ),
    );
  }
}
