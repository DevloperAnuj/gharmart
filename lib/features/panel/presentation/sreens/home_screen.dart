import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharmart/features/panel/presentation/widgets/property_list_widget.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

import '../widgets/property_card_widget.dart';
import '../widgets/search_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyBuilder(
      mobileView: HomeScreenMobile(),
      tabletView: HomeScreenTablet(),
      deskView: HomeScreenDesktop(),
    );
  }
}

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchSection(),
        PropertiesListWidget(),
      ],
    );
  }
}

class HomeScreenTablet extends StatelessWidget {
  const HomeScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchSection(),
        PropertiesListWidget(),
      ],
    );
  }
}

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchSection(),
        PropertiesListWidget(),
      ],
    );
  }
}

