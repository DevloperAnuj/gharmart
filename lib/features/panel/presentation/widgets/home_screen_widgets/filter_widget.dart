import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/display_properties/display_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/filter/listing_filter_cubit.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:money_formatter/money_formatter.dart';

class FilterWidgetDesktop extends StatelessWidget {
  const FilterWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<ListingFilterCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<DisplayPropertiesCubit>(),
        ),
      ],
      child: BlocBuilder<ListingFilterCubit, ListingFilterState>(
        builder: (context, filterState) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CSCPicker(
                    flagState: CountryFlag.DISABLE,
                    defaultCountry: CscCountry.India,
                    disabledDropdownDecoration:
                        const BoxDecoration(color: Colors.white),
                    currentCity: "Pune",
                    currentState: "Maharashtra",
                    onCountryChanged: (country) {
                      context.read<ListingFilterCubit>().applyCountry(country);
                    },
                    onStateChanged: (state) {
                      String selectedState = state ?? "Maharashtra";
                      context
                          .read<ListingFilterCubit>()
                          .applyState(selectedState);
                    },
                    onCityChanged: (city) {
                      String selectedCity = city ?? "Pune";
                      context
                          .read<ListingFilterCubit>()
                          .applyCity(selectedCity);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Filters",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                    ),
                  ),
                  Wrap(
                    spacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomChoiceChip(
                        label: "Rent",
                        selected: filterState.propertyType == "Rent",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyPropertyType("Rent");
                        },
                      ),
                      CustomChoiceChip(
                        label: "Sell",
                        selected: filterState.propertyType == "Sell",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyPropertyType("Sell");
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    child: Text(
                      "BHK Type",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomChoiceChip(
                        label: "1 RK",
                        selected: filterState.bhkType == "1 RK",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyBhkType("1 RK");
                        },
                      ),
                      CustomChoiceChip(
                        label: "1 BHK",
                        selected: filterState.bhkType == "1 BHK",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyBhkType("1 BHK");
                        },
                      ),
                      CustomChoiceChip(
                        label: "2 BHK",
                        selected: filterState.bhkType == "2 BHK",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyBhkType("2 BHK");
                        },
                      ),
                      CustomChoiceChip(
                        label: "3 BHK",
                        selected: filterState.bhkType == "3 BHK",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyBhkType("3 BHK");
                        },
                      ),
                      CustomChoiceChip(
                        label: "4 BHK",
                        selected: filterState.bhkType == "4 BHK",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyBhkType("4 BHK");
                        },
                      ),
                      CustomChoiceChip(
                        label: "4+ BHK",
                        selected: filterState.bhkType == "4+ BHK",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyBhkType("4+ BHK");
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10,
                    ),
                    child: Text(
                      filterState.propertyType == "Rent"
                          ? "Rent Range"
                          : "Price Range",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  //For Renting Slider
                  if (filterState.propertyType == "Rent")
                    SizedBox(
                      child: RangeSlider(
                        min: 1000,
                        max: 100000,
                        labels: RangeLabels(
                          MyFormattedMoney(filterState.rentMin),
                          MyFormattedMoney(filterState.rentMax),
                        ),
                        values: RangeValues(
                          filterState.rentMin.toDouble(),
                          filterState.rentMax.toDouble(),
                        ),
                        onChanged: (range) {
                          context.read<ListingFilterCubit>().applyRent(
                                range.start.round(),
                                range.end.round(),
                              );
                        },
                      ),
                    ),
                  //For Selling Slider
                  if (filterState.propertyType == "Sell")
                    SizedBox(
                      child: RangeSlider(
                        min: 100000,
                        max: 90000000,
                        labels: RangeLabels(
                          MyFormattedMoney(filterState.priceMin),
                          MyFormattedMoney(filterState.priceMax),
                        ),
                        values: RangeValues(
                          filterState.priceMin.toDouble(),
                          filterState.priceMax.toDouble(),
                        ),
                        onChanged: (range) {
                          context.read<ListingFilterCubit>().applyPrice(
                                range.start.round(),
                                range.end.round(),
                              );
                        },
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10,
                    ),
                    child: Text(
                      "Preferred Tenants",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomChoiceChip(
                        label: "Family",
                        selected: filterState.prefTen == "Family",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyPrefTent("Family");
                        },
                      ),
                      CustomChoiceChip(
                        label: "Bachelor Male",
                        selected: filterState.prefTen == "Bachelor Male",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyPrefTent("Bachelor Male");
                        },
                      ),
                      CustomChoiceChip(
                        label: "Bachelor Female",
                        selected: filterState.prefTen == "Bachelor Female",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyPrefTent("Bachelor Female");
                        },
                      ),
                      CustomChoiceChip(
                        label: "All",
                        selected: filterState.prefTen == "All",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyPrefTent("All");
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    child: Text(
                      "Furnishing",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomChoiceChip(
                        label: "Full",
                        selected: filterState.furnishing == "Full",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyFurnishing("Full");
                        },
                      ),
                      CustomChoiceChip(
                        label: "Semi",
                        selected: filterState.furnishing == "Semi",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyFurnishing("Semi");
                        },
                      ),
                      CustomChoiceChip(
                        label: "None",
                        selected: filterState.furnishing == "None",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyFurnishing("None");
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    child: Text(
                      "Parking",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomChoiceChip(
                        label: "Bike",
                        selected: filterState.parking == "Bike",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyParking("Bike");
                        },
                      ),
                      CustomChoiceChip(
                        label: "Car",
                        selected: filterState.parking == "Car",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyParking("Car");
                        },
                      ),
                      CustomChoiceChip(
                        label: "Bike and Car",
                        selected: filterState.parking == "Bike and Car",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyParking("Bike and Car");
                        },
                      ),
                      CustomChoiceChip(
                        label: "None",
                        selected: filterState.parking == "None",
                        onSelected: (val) {
                          context
                              .read<ListingFilterCubit>()
                              .applyParking("None");
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<DisplayPropertiesCubit>()
                            .displayFilteredProperties();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.filter_alt),
                      label: const Text("Apply Filter"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
      backgroundColor: Colors.white,
      selected: selected,
      onSelected: onSelected,
      selectedColor: Theme.of(context).primaryColor,
      checkmarkColor: Colors.white,
    );
  }

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });
}

// ignore: non_constant_identifier_names
String MyFormattedMoney(int price) {
  return MoneyFormatter(
    amount: price.toDouble(),
    settings: MoneyFormatterSettings(
        symbol: "₹",
        compactFormatType: CompactFormatType.short,
        thousandSeparator: ','),
  ).output.compactSymbolOnLeft;
}
