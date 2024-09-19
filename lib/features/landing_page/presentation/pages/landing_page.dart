import 'package:csc_picker/csc_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/filter/listing_filter_cubit.dart';
import 'package:gharmart/features/panel/presentation/pages/panel_page.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/my_app_bar.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import 'package:gharmart/features/properties/presentation/pages/add_property_page.dart';
import 'package:gharmart/features/properties/presentation/widgets/add_property_form.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/constants.dart';
import 'package:gharmart/utils/my_layout_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../home_listings/presentation/manager/display_properties/display_properties_cubit.dart';
import '../../../home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
import '../../../panel/presentation/manager/panel_logic/panel_logic_cubit.dart';
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
          value: serviceConfig.get<FetchProfileCubit>()..fetchProfile(),
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/lbg.png'),
          repeat: ImageRepeat.repeatY,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text("Gharmarket"),
          titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
          actions: const [
            AddPropertyMenuButtonMobile(),
            MyPopUpMenuButton(),
          ],
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomChoiceChip(
                    label: "Rent",
                    selected: context
                            .watch<ListingFilterCubit>()
                            .state
                            .propertyType ==
                        "Rent",
                    onSelected: (val) {
                      context
                          .read<ListingFilterCubit>()
                          .applyPropertyType("Rent");
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomChoiceChip(
                    label: "Sell",
                    selected: context
                            .watch<ListingFilterCubit>()
                            .state
                            .propertyType ==
                        "Sell",
                    onSelected: (val) async {
                      context
                          .read<ListingFilterCubit>()
                          .applyPropertyType("Sell");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Theme(
                        data: ThemeData(),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_on_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 3),
                            ),
                          ),
                          hint: const Text('Select City'),
                          value: context.watch<ListingFilterCubit>().state.city,
                          onChanged: (String? newValue) {
                            context
                                .read<ListingFilterCubit>()
                                .applyCity(newValue!);
                          },
                          items: <String>[
                            'Pune',
                            // 'Mumbai',
                            // 'Nashik',
                            // 'Nagpur',
                            // 'Satara',
                            // 'Kolhapur'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SearchLandMarkDropDownMobile(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Theme(
                        data: ThemeData(),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.window_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 3),
                            ),
                          ),
                          hint: const Text('Select BHK Type'),
                          value:
                              context.watch<ListingFilterCubit>().state.bhkType,
                          onChanged: (String? newValue) {
                            context
                                .read<ListingFilterCubit>()
                                .applyBhkType(newValue!);
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Theme(
                        data: ThemeData(),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Theme.of(context).primaryColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 3),
                            ),
                          ),
                          hint: const Text('Select Property Category'),
                          value: context
                              .watch<ListingFilterCubit>()
                              .state
                              .propertyCat,
                          onChanged: (String? newValue) {
                            context
                                .read<ListingFilterCubit>()
                                .applyPropertyCat(newValue!);
                          },
                          items: <String>[
                            'Room',
                            'Flat',
                            'Bungalow',
                            'Row House',
                            'Mansion',
                            'PG'
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
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.6,
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
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500.withOpacity(0.2),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.done_outline,
                        size: 80,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        "100% Genuine \nOwner",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500.withOpacity(0.2),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Zero Brokers \nNo Middleman",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.black),
                      ),
                      Icon(
                        Icons.person_off_sharp,
                        size: 80,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500.withOpacity(0.2),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.handshake_outlined,
                        size: 80,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        "Save on \nBrokerage",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500.withOpacity(0.2),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Cost Effective",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.black),
                      ),
                      Icon(
                        Icons.currency_rupee,
                        size: 80,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: AddPropertyMenuButton(),
              ),
            ],
          ),
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
            title: const Text("Gharmarket"),
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/lbg.png'),
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: const SizedBox.shrink(),
          elevation: 2,
          title: const Text("Gharmarket"),
          centerTitle: false,
          titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
          actions: const [
            AddPropertyMenuButton(),
            SizedBox(width: 20),
            MyPopUpMenuButton(),
            SizedBox(width: 50),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Why Should U Pay Money for the Broker if You Want to \nJust Connect with Owner...?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "No Broker,Just Owner",
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
                    selected: context
                            .watch<ListingFilterCubit>()
                            .state
                            .propertyType ==
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
                    selected: context
                            .watch<ListingFilterCubit>()
                            .state
                            .propertyType ==
                        "Sell",
                    onSelected: (val) {
                      context
                          .read<ListingFilterCubit>()
                          .applyPropertyType("Sell");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 2),
                              child: Theme(
                                data: ThemeData(),
                                child: DropdownButtonFormField<String>(
                                  dropdownColor: Theme.of(context).primaryColor,
                                  icon: const Icon(null),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.location_on_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 3),
                                    ),
                                  ),
                                  hint: const Text('Select City'),
                                  style: const TextStyle(color: Colors.white70),
                                  value: context
                                      .watch<ListingFilterCubit>()
                                      .state
                                      .city,
                                  onChanged: (String? newValue) {
                                    context
                                        .read<ListingFilterCubit>()
                                        .applyCity(newValue!);
                                  },
                                  items: <String>[
                                    'Pune',
                                    // 'Mumbai',
                                    // 'Nashik',
                                    // 'Nagpur',
                                    // 'Satara',
                                    // 'Kolhapur'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const VerticalDivider(color: Colors.white),
                          const SearchLandMarkDropDown(),
                          const VerticalDivider(color: Colors.white),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 2),
                              child: Theme(
                                data: ThemeData(),
                                child: DropdownButtonFormField<String>(
                                  dropdownColor: Theme.of(context).primaryColor,
                                  icon: const Icon(null),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 3),
                                    ),
                                  ),
                                  hint: const Text('Select BHK Type'),
                                  style: const TextStyle(color: Colors.white70),
                                  value: context
                                      .watch<ListingFilterCubit>()
                                      .state
                                      .bhkType,
                                  onChanged: (String? newValue) {
                                    context
                                        .read<ListingFilterCubit>()
                                        .applyBhkType(newValue!);
                                  },
                                  items: <String>[
                                    '1 RK',
                                    '1 BHK',
                                    '2 BHK',
                                    '3 BHK',
                                    '4 BHK',
                                    '4+ BHK'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const VerticalDivider(color: Colors.white),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 2),
                              child: Theme(
                                data: ThemeData(),
                                child: DropdownButtonFormField<String>(
                                  dropdownColor: Theme.of(context).primaryColor,
                                  icon: const Icon(null),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 3),
                                    ),
                                  ),
                                  hint: const Text('Property Category'),
                                  style: const TextStyle(color: Colors.white70),
                                  value: context
                                      .watch<ListingFilterCubit>()
                                      .state
                                      .propertyCat,
                                  onChanged: (String? newValue) {
                                    context
                                        .read<ListingFilterCubit>()
                                        .applyPropertyCat(newValue!);
                                  },
                                  items: <String>[
                                    'Room',
                                    'Flat',
                                    'Bungalow',
                                    'Row House',
                                    'Mansion',
                                    'PG'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<DisplayPropertiesCubit>()
                                  .displayFilteredProperties();
                              context.pushNamed(PanelPage.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                            ),
                            child: const Text("Find Property"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "100% Genuine Owners",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                        ),
                      ),
                      VerticalDivider(
                        color: Theme.of(context).primaryColor,
                        width: 20,
                      ),
                      Text(
                        "Zero Brokers",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                        ),
                      ),
                      VerticalDivider(
                        color: Theme.of(context).primaryColor,
                        width: 20,
                      ),
                      Text(
                        "Save Brokerage",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                        ),
                      ),
                      VerticalDivider(
                        color: Theme.of(context).primaryColor,
                        width: 20,
                      ),
                      Text(
                        "Cost Effective",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(endIndent: 20, indent: 20),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Are You Property Owner Want to Sale or Rent",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextButton(
                  onPressed: () {
                    if (toAuthWrap(context)) {
                      context.pushNamed(AddPropertyPage.routeName);
                    }
                  },
                  child: Text(
                    "Post Your Property For Free",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 200,
                  height: 5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async {
                          final Uri url = Uri.parse('https://policy.gharmarket.com/privacy-policy-2/');
                          if (!await launchUrl(url)) {
                            print('Could not launch $url');
                          }
                        },
                      ),
                      VerticalDivider(
                        color: Theme.of(context).primaryColor,
                        width: 20,
                      ),
                      TextButton(
                        child: Text(
                          "Terms and Conditions",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async {
                          final Uri url = Uri.parse('https://policy.gharmarket.com/terms-and-conditions/');
                          if (!await launchUrl(url)) {
                            print('Could not launch $url');
                          }
                        },
                      ),
                      VerticalDivider(
                        color: Theme.of(context).primaryColor,
                        width: 20,
                      ),
                      TextButton(
                        child: Text(
                          "Refund Policy",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async {
                          final Uri url = Uri.parse('https://policy.gharmarket.com/refund-policy/');
                          if (!await launchUrl(url)) {
                            print('Could not launch $url');
                          }
                        },
                      ),
                      VerticalDivider(
                        color: Theme.of(context).primaryColor,
                        width: 20,
                      ),
                      TextButton(
                        child: Text(
                          "Support",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async {
                          final Uri url = Uri.parse('https://policy.gharmarket.com/support/');
                          if (!await launchUrl(url)) {
                            print('Could not launch $url');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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

class AddPropertyMenuButton extends StatelessWidget {
  const AddPropertyMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (toAuthWrap(context)) {
          context.pushNamed(AddPropertyPage.routeName);
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: const Text("List Property for Free"),
    );
  }
}

class AddPropertyMenuButtonMobile extends StatelessWidget {
  const AddPropertyMenuButtonMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (toAuthWrap(context)) {
          context.pushNamed(AddPropertyPage.routeName);
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: const Text("List Property"),
    );
  }
}

class SearchLandMarkDropDown extends StatefulWidget {
  const SearchLandMarkDropDown({super.key});

  @override
  State<SearchLandMarkDropDown> createState() => _SearchLandMarkDropDownState();
}

class _SearchLandMarkDropDownState extends State<SearchLandMarkDropDown> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Theme(
        data: ThemeData(),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            iconStyleData: const IconStyleData(icon: Icon(null)),
            style: const TextStyle(color: Colors.white70),
            isExpanded: true,
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
            value: context.watch<ListingFilterCubit>().state.landmark,
            onChanged: (value) {
              if (value != null) {
                context.read<ListingFilterCubit>().applyLandmark(value);
              }
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 200,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
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
                  expands: true,
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

class SearchLandMarkDropDownMobile extends StatefulWidget {
  const SearchLandMarkDropDownMobile({super.key});

  @override
  State<SearchLandMarkDropDownMobile> createState() =>
      _SearchLandMarkDropDownMobile();
}

class _SearchLandMarkDropDownMobile
    extends State<SearchLandMarkDropDownMobile> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2.5,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            iconStyleData: const IconStyleData(icon: Icon(null)),
            style: const TextStyle(color: Colors.white70),
            isExpanded: true,
            items: landmarksPune
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ))
                .toList(),
            value: context.watch<ListingFilterCubit>().state.landmark,
            onChanged: (value) {
              if (value != null) {
                context.read<ListingFilterCubit>().applyLandmark(value);
              }
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 200,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
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
                  expands: true,
                  maxLines: null,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: 'Search for an Landmark...',
                    hintStyle:
                        const TextStyle(fontSize: 12, color: Colors.grey),
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
