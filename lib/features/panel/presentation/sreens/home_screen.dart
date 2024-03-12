import 'package:flutter/material.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/search_section.dart';

import '../widgets/home_screen_widgets/filter_widget.dart';
import '../widgets/home_screen_widgets/property_list_widget.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          SearchSectionMobile(),
          PropertiesListWidgetMobile(),
        ],
      ),
    );
  }
}

class HomeScreenTablet extends StatelessWidget {
  const HomeScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          SearchSectionTablet(),
          PropertiesListWidgetTablet(),
        ],
      ),
    );
  }
}

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchbarSectionDesktop(),
        Divider(),
        Expanded(
          child: Row(
            children: [
              PropertiesListWidgetDesktop(),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
