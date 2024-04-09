import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/favorite_property/favorite_property_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/get_user_properties/get_user_properties_cubit.dart';
import 'package:gharmart/features/panel/presentation/widgets/my_listing_screen_widgets/my_properties_list_widget.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/my_layout_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../properties/presentation/pages/add_property_page.dart';
import '../widgets/my_listing_screen_widgets/dash_info_widget.dart';

class MyPropertiesListingPage extends StatelessWidget {

  const MyPropertiesListingPage({super.key});

  static const String routeName = "/mylisting";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<GetUserPropertiesCubit>()
            ..getUserProperties(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<FavoritePropertyCubit>(),
        ),
      ],
      child: Container(
        decoration:  BoxDecoration(
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
            leading: const SizedBox.shrink(),
            elevation: 2,
            title: const Text("Gharmarket"),
            titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
          ),
          body: const MyBuilder(
            mobileView: ListingScreenMobile(),
            tabletView: ListingScreenTablet(),
            deskView: ListingScreenDesktop(),
          ),
        ),
      ),
    );
  }
}

class ListingScreenMobile extends StatelessWidget {
  const ListingScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                context.pushNamed(AddPropertyPage.routeName);
              },
              icon: const Icon(Icons.add_home_rounded),
              label: const Text("Add New Property"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
            // DashInfoWidgetMobile(),
            MyPropertiesListWidgetMobile(),
          ],
        ),
      ),
    );
  }
}

class ListingScreenTablet extends StatelessWidget {
  const ListingScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              context.pushNamed(AddPropertyPage.routeName);
            },
            icon: const Icon(Icons.add_home_rounded),
            label: const Text("Add New Property"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
          //DashInfoWidgetMobile(),
          MyPropertiesListWidgetTablet(),
        ],
      ),
    );
  }
}

class ListingScreenDesktop extends StatelessWidget {
  const ListingScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        MyPropertiesListWidgetDesktop(),
        DashInfoWidget(),
      ],
    );
  }
}
