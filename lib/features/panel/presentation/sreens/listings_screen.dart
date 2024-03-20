import 'package:flutter/material.dart';
import 'package:gharmart/features/panel/presentation/widgets/my_listing_screen_widgets/my_properties_list_widget.dart';

import '../widgets/my_listing_screen_widgets/dash_info_widget.dart';
class ListingScreenMobile extends StatelessWidget {
  const ListingScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DashInfoWidgetMobile(),
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
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DashInfoWidgetMobile(),
            MyPropertiesListWidgetMobile(),
          ],
        ),
      ),
    );
  }
}

class ListingScreenDesktop extends StatelessWidget {
  const ListingScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
      children: [
        MyPropertiesListWidgetDesktop(),
        DashInfoWidget(),
      ],
    );
  }
}
