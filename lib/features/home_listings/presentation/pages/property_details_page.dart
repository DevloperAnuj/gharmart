import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/presentation/widgets/second_head_row_widget.dart';
import 'package:gharmart/utils/my_layout_builder.dart';
import 'package:image_collage/image_collage.dart';

import '../../../panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';
import '../widgets/description_widget.dart';
import '../widgets/details_header_widget.dart';
import '../widgets/property_highlight_widget.dart';
import '../widgets/property_image_college.dart';

class PropertyDetailsPage extends StatelessWidget {
  static const String routeName = "/propertydetail";

  @override
  Widget build(BuildContext context) {
    return const MyBuilder(
      mobileView: PropertyDetailsPageMobile(),
      tabletView: PropertyDetailsPageTablet(),
      deskView: PropertyDetailsPageDesktop(),
    );
  }

  const PropertyDetailsPage({super.key});
}

class PropertyDetailsPageMobile extends StatelessWidget {
  const PropertyDetailsPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(),
          Container(),
        ],
      ),
    );
  }
}

class PropertyDetailsPageTablet extends StatelessWidget {
  const PropertyDetailsPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(),
          Container(),
        ],
      ),
    );
  }
}

class PropertyDetailsPageDesktop extends StatelessWidget {
  const PropertyDetailsPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Divider(),
          const DetailsHeaderWidgetDesktop(),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    const Divider(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Row(
                        children: [
                          PropertyImageCollageWidget(),
                          VerticalDivider(),
                          PropertyHighlightsWidget(),
                          VerticalDivider(),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SecondHeadRowWidget(),
                    const Divider(),
                    const DescriptionWidget(),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


