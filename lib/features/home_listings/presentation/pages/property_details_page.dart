import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/home_listings/presentation/widgets/second_head_row_widget.dart';
import 'package:gharmart/utils/my_layout_builder.dart';
import 'package:image_collage/image_collage.dart';

import '../../../panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';
import '../widgets/description_widget.dart';
import '../widgets/details_header_widget.dart';
import '../widgets/property_highlight_widget.dart';
import '../widgets/property_image_college.dart';

class PropertyDetailsPage extends StatelessWidget {

  final PropertyEntity property;

  static const String routeName = "propertydetail";

  @override
  Widget build(BuildContext context) {
    return  MyBuilder(
      mobileView: PropertyDetailsPageMobile(),
      tabletView: PropertyDetailsPageTablet(),
      deskView: PropertyDetailsPageDesktop(
        property: property,
      ),
    );
  }

  const PropertyDetailsPage({super.key,
    required this.property,
  });
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

  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Divider(),
           DetailsHeaderWidgetDesktop(
            property: property,
          ),
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
                      child:  Row(
                        children: [
                          PropertyImageCollageWidget(
                            imageList: property.picsUrl,
                          ),
                          VerticalDivider(),
                          PropertyHighlightsWidget(
                            property: property,
                          ),
                          VerticalDivider(),
                        ],
                      ),
                    ),
                    const Divider(),
                     SecondHeadRowWidget(
                      property: property,
                    ),
                    const Divider(),
                     DescriptionWidget(
                      property: property,
                    ),
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

  const PropertyDetailsPageDesktop({
    super.key,
    required this.property,
  });

}
