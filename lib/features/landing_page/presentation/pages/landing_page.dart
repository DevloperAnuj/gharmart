import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/filter/listing_filter_cubit.dart';
import 'package:gharmart/features/panel/presentation/pages/panel_page.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/my_layout_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../home_listings/presentation/manager/display_properties/display_properties_cubit.dart';
import '../../../home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
import '../../../panel/presentation/widgets/home_screen_widgets/filter_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<FetchPropertiesCubit>()..fetchProperties(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<ListingFilterCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<DisplayPropertiesCubit>(),
        ),
      ],
      child: const MyBuilder(
        mobileView: LandingPageMobile(),
        tabletView: LandingPageMobile(),
        deskView: LandingPageDesktop(),
      ),
    );
  }
}

class LandingPageMobile extends StatelessWidget {
  const LandingPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GharMarket"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Why Should U Pay Money for the Broker if You Want to Just Connect with Owner ?",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "No Broker, \nJust Owner",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomChoiceChip(
                  label: "Rent",
                  selected:
                      context.watch<ListingFilterCubit>().state.propertyType ==
                          "Rent",
                  onSelected: (val) {
                    context
                        .read<ListingFilterCubit>()
                        .applyPropertyType("Rent");
                  },
                ),
                CustomChoiceChip(
                  label: "Sell",
                  selected:
                      context.watch<ListingFilterCubit>().state.propertyType ==
                          "Sell",
                  onSelected: (val) {
                    context
                        .read<ListingFilterCubit>()
                        .applyPropertyType("Sell");
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CSCPicker(
                searchBarRadius: 30,
                flagState: CountryFlag.DISABLE,
                defaultCountry: CscCountry.India,
                disabledDropdownDecoration:
                    const BoxDecoration(color: Colors.white),
                currentCity: "Pune",
                currentState: "Maharashtra",
                currentCountry: "India",
                onCountryChanged: (country) {
                  context.read<ListingFilterCubit>().applyCountry(country);
                },
                onStateChanged: (state) {
                  String selectedState = state ?? "Maharashtra";
                  context.read<ListingFilterCubit>().applyState(selectedState);
                },
                onCityChanged: (city) {
                  String? selectedCity = city == "City" ? "Pune" : city;
                  context.read<ListingFilterCubit>().applyCity(selectedCity!);
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Theme(
                data: ThemeData(),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 3),
                    ),
                  ),
                  hint: const Text('Select BHK Type'),
                  value: context.watch<ListingFilterCubit>().state.bhkType,
                  onChanged: (String? newValue) {
                    context.read<ListingFilterCubit>().applyBhkType(newValue!);
                  },
                  items: <String>[
                    '1 RK',
                    '1 BHK',
                    '2 BHK',
                    '3 BHK',
                    '4 BHK',
                    '4+ BHK'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            if (context.watch<ListingFilterCubit>().state.propertyType ==
                "Rent")
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Theme(
                  data: ThemeData(),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 3),
                      ),
                    ),
                    hint: const Text('Select Rent Range'),
                    value: 'from 0 to 5K',
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        applyRentRange(context, newValue);
                      }
                    },
                    items: <String>[
                      'from 0 to 5K',
                      'from 5K to 10K',
                      'from 10K to 25K',
                      'from 25K to 50K',
                      'from 50K to 75K',
                      'from 75K to 1 Lac',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            if (context.watch<ListingFilterCubit>().state.propertyType ==
                "Sell")
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Theme(
                  data: ThemeData(),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 3),
                      ),
                    ),
                    hint: const Text('Select Rent Range'),
                    value: 'from 0 to 5K',
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        applySellPriceRange(context, newValue);
                      }
                    },
                    items: <String>[
                      'from 0 to 5 Lac',
                      'from 5 Lac to 25 Lac',
                      'from 25 Lac to 50 Lac',
                      'from 50 lac to 75 Lac',
                      'from 75 Lac to 1 Cr',
                      'from 1 Cr to 5 Cr',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<DisplayPropertiesCubit>()
                      .displayFilteredProperties();
                  context.pushNamed(PanelPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text("Find Property"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  applyRentRange(BuildContext context, String newValue) {
    if (newValue == 'from 0 to 5K') {
      context.read<ListingFilterCubit>().applyRent(0, 5000);
    }
    if (newValue == 'from 5K to 10K') {
      context.read<ListingFilterCubit>().applyRent(5000, 10000);
    }
    if (newValue == 'from 10K to 25K') {
      context.read<ListingFilterCubit>().applyRent(10000, 25000);
    }
    if (newValue == 'from 25K to 50K') {
      context.read<ListingFilterCubit>().applyRent(25000, 50000);
    }
    if (newValue == 'from 50K to 75K') {
      context.read<ListingFilterCubit>().applyRent(50000, 75000);
    }
    if (newValue == 'from 75K to 1 Lac') {
      context.read<ListingFilterCubit>().applyRent(75000, 100000);
    }
  }

  applySellPriceRange(BuildContext context, String newValue) {
    if (newValue == 'from 0 to 5 Lac') {
      context.read<ListingFilterCubit>().applyPrice(0, 500000);
    }
    if (newValue == 'from 5 Lac to 25 Lac') {
      context.read<ListingFilterCubit>().applyPrice(500000, 2500000);
    }
    if (newValue == 'from 25 Lac to 50 Lac') {
      context.read<ListingFilterCubit>().applyPrice(2500000, 5000000);
    }
    if (newValue == 'from 50 lac to 75 Lac') {
      context.read<ListingFilterCubit>().applyPrice(5000000, 7500000);
    }
    if (newValue == 'from 75 Lac to 1 Cr') {
      context.read<ListingFilterCubit>().applyPrice(7500000, 10000000);
    }
    if (newValue == 'from 1 Cr to 5 Cr') {
      context.read<ListingFilterCubit>().applyPrice(10000000, 50000000);
    }
  }
}

class LandingPageTablet extends StatelessWidget {
  const LandingPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: const Text("GharMarket"),
          ),
        ],
      ),
    );
  }
}

class LandingPageDesktop extends StatelessWidget {
  const LandingPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GharMarket"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Why Should U Pay Money for the Broker if You Want to Just Connect with Owner ?",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "No Broker, \nJust Owner",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomChoiceChip(
                  label: "Rent",
                  selected:
                      context.watch<ListingFilterCubit>().state.propertyType ==
                          "Rent",
                  onSelected: (val) {
                    context
                        .read<ListingFilterCubit>()
                        .applyPropertyType("Rent");
                  },
                ),
                const SizedBox(width: 50),
                CustomChoiceChip(
                  label: "Sell",
                  selected:
                      context.watch<ListingFilterCubit>().state.propertyType ==
                          "Sell",
                  onSelected: (val) {
                    context
                        .read<ListingFilterCubit>()
                        .applyPropertyType("Sell");
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CSCPicker(
                searchBarRadius: 30,
                flagState: CountryFlag.DISABLE,
                defaultCountry: CscCountry.India,
                disabledDropdownDecoration:
                    const BoxDecoration(color: Colors.white),
                currentCity: "Pune",
                currentState: "Maharashtra",
                currentCountry: "India",
                onCountryChanged: (country) {
                  context.read<ListingFilterCubit>().applyCountry(country);
                },
                onStateChanged: (state) {
                  String selectedState = state ?? "Maharashtra";
                  context.read<ListingFilterCubit>().applyState(selectedState);
                },
                onCityChanged: (city) {
                  String? selectedCity = city == "City" ? "Pune" : city;
                  context.read<ListingFilterCubit>().applyCity(selectedCity!);
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Theme(
                      data: ThemeData(),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor, width: 3),
                          ),
                        ),
                        hint: const Text('Select BHK Type'),
                        value: context.watch<ListingFilterCubit>().state.bhkType,
                        onChanged: (String? newValue) {
                          context.read<ListingFilterCubit>().applyBhkType(newValue!);
                        },
                        items: <String>[
                          '1 RK',
                          '1 BHK',
                          '2 BHK',
                          '3 BHK',
                          '4 BHK',
                          '4+ BHK'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                if (context.watch<ListingFilterCubit>().state.propertyType ==
                    "Rent")
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Theme(
                        data: ThemeData(),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor, width: 3),
                            ),
                          ),
                          hint: const Text('Select Rent Range'),
                          value: 'from 0 to 5K',
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              applyRentRange(context, newValue);
                            }
                          },
                          items: <String>[
                            'from 0 to 5K',
                            'from 5K to 10K',
                            'from 10K to 25K',
                            'from 25K to 50K',
                            'from 50K to 75K',
                            'from 75K to 1 Lac',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                if (context.watch<ListingFilterCubit>().state.propertyType ==
                    "Sell")
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Theme(
                        data: ThemeData(),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor, width: 3),
                            ),
                          ),
                          hint: const Text('Select Rent Range'),
                          value: 'from 0 to 5K',
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              applySellPriceRange(context, newValue);
                            }
                          },
                          items: <String>[
                            'from 0 to 5 Lac',
                            'from 5 Lac to 25 Lac',
                            'from 25 Lac to 50 Lac',
                            'from 50 lac to 75 Lac',
                            'from 75 Lac to 1 Cr',
                            'from 1 Cr to 5 Cr',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<DisplayPropertiesCubit>()
                      .displayFilteredProperties();
                  context.pushNamed(PanelPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text("Find Property"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  applyRentRange(BuildContext context, String newValue) {
    if (newValue == 'from 0 to 5K') {
      context.read<ListingFilterCubit>().applyRent(0, 5000);
    }
    if (newValue == 'from 5K to 10K') {
      context.read<ListingFilterCubit>().applyRent(5000, 10000);
    }
    if (newValue == 'from 10K to 25K') {
      context.read<ListingFilterCubit>().applyRent(10000, 25000);
    }
    if (newValue == 'from 25K to 50K') {
      context.read<ListingFilterCubit>().applyRent(25000, 50000);
    }
    if (newValue == 'from 50K to 75K') {
      context.read<ListingFilterCubit>().applyRent(50000, 75000);
    }
    if (newValue == 'from 75K to 1 Lac') {
      context.read<ListingFilterCubit>().applyRent(75000, 100000);
    }
  }

  applySellPriceRange(BuildContext context, String newValue) {
    if (newValue == 'from 0 to 5 Lac') {
      context.read<ListingFilterCubit>().applyPrice(0, 500000);
    }
    if (newValue == 'from 5 Lac to 25 Lac') {
      context.read<ListingFilterCubit>().applyPrice(500000, 2500000);
    }
    if (newValue == 'from 25 Lac to 50 Lac') {
      context.read<ListingFilterCubit>().applyPrice(2500000, 5000000);
    }
    if (newValue == 'from 50 lac to 75 Lac') {
      context.read<ListingFilterCubit>().applyPrice(5000000, 7500000);
    }
    if (newValue == 'from 75 Lac to 1 Cr') {
      context.read<ListingFilterCubit>().applyPrice(7500000, 10000000);
    }
    if (newValue == 'from 1 Cr to 5 Cr') {
      context.read<ListingFilterCubit>().applyPrice(10000000, 50000000);
    }
  }
}
