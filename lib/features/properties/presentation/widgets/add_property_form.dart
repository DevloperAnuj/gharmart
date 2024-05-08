import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/properties/presentation/manager/add_property_temp_cubit/add_property_cubit.dart';

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
                    child: Theme(
                      data: ThemeData(),
                      child: CSCPicker(
                        dropdownDecoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(15)),
                        flagState: CountryFlag.DISABLE,
                        defaultCountry: CscCountry.India,
                        disabledDropdownDecoration:
                            const BoxDecoration(color: Colors.white),
                        currentCity: "Pune",
                        currentState: "Maharashtra",
                        onCountryChanged: (country) {
                          context
                              .read<AddPropertyTempCubit>()
                              .selectCountry(country);
                        },
                        onStateChanged: (state) {
                          String selectedState = state ?? "Maharashtra";
                          context
                              .read<AddPropertyTempCubit>()
                              .selectState(selectedState);
                        },
                        onCityChanged: (city) {
                          String selectedCity = city ?? "Pune";
                          context
                              .read<AddPropertyTempCubit>()
                              .selectCity(selectedCity);
                        },
                      ),
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
                  AddPropertyTextFormField(
                    initialValue: tempState.desc,
                    hint: "Description",
                    max: 4,
                    onChanged: (text) {
                      context.read<AddPropertyTempCubit>().getDescription(text);
                    },
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
                child: Theme(
                  data: ThemeData(),
                  child: CSCPicker(
                    dropdownDecoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(15)),
                    flagState: CountryFlag.DISABLE,
                    defaultCountry: CscCountry.India,
                    disabledDropdownDecoration:
                    const BoxDecoration(color: Colors.white),
                    currentCity: "Pune",
                    currentState: "Maharashtra",
                    onCountryChanged: (country) {
                      context
                          .read<AddPropertyTempCubit>()
                          .selectCountry(country);
                    },
                    onStateChanged: (state) {
                      String selectedState = state ?? "Maharashtra";
                      context
                          .read<AddPropertyTempCubit>()
                          .selectState(selectedState);
                    },
                    onCityChanged: (city) {
                      String selectedCity = city ?? "Pune";
                      context
                          .read<AddPropertyTempCubit>()
                          .selectCity(selectedCity);
                    },
                  ),
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
              AddPropertyTextFormField(
                initialValue: tempState.desc,
                hint: "Description",
                max: 4,
                onChanged: (text) {
                  context.read<AddPropertyTempCubit>().getDescription(text);
                },
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
          color: Colors.grey.shade400,
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
          fillColor: Colors.grey.shade400,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        keyboardType: max > 1 ? TextInputType.multiline : inputType,
        maxLines: max+1,
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
