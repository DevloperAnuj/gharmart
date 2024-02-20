import 'package:flutter/material.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/my_app_bar.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/property_list_widget.dart';
import 'package:gharmart/features/panel/presentation/widgets/my_listing_screen_widgets/my_properties_list_widget.dart';

import '../widgets/my_listing_screen_widgets/dash_info_widget.dart';
import '../widgets/my_listing_screen_widgets/my_listing_info_tile.dart';

class ListingScreenMobile extends StatelessWidget {
  const ListingScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}

class ListingScreenTablet extends StatelessWidget {
  const ListingScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}

class ListingScreenDesktop extends StatelessWidget {
  const ListingScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          MyPropertiesListWidgetDesktop(),
          DashInfoWidget(),
        ],
      ),
    );
  }
}
