import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/home_listings/presentation/widgets/second_head_row_widget.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

import '../../../../utils/config_file.dart';
import '../../../../utils/constants.dart';
import '../../../panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';
import '../manager/favorite_property/favorite_property_cubit.dart';
import '../manager/report_property/report_property_cubit.dart';
import '../widgets/description_widget.dart';
import '../widgets/details_header_widget.dart';
import '../widgets/property_highlight_widget.dart';
import '../widgets/property_image_college.dart';

class PropertyDetailsPage extends StatelessWidget {
  final PropertyEntity property;

  static const String routeName = "/propertydetail";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<ReportPropertyCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<FavoritePropertyCubit>(),
        ),
      ],
      child: MyBuilder(
        mobileView: PropertyDetailsPageMobile(
          property: property,
        ),
        tabletView: PropertyDetailsPageTablet(
          property: property,
        ),
        deskView: PropertyDetailsPageDesktop(
          property: property,
        ),
      ),
    );
  }

  const PropertyDetailsPage({
    super.key,
    required this.property,
  });
}

class PropertyDetailsPageMobile extends StatelessWidget {
  final PropertyEntity property;

  const PropertyDetailsPageMobile({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PropertyDetailHeaderMobile(property: property),
          PropertyOverviewWidgetsMobile(property: property),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (toAuthWrap(context)) {
                    showOwnerTile(context, property);
                  }
                },
                icon: const Icon(Icons.info),
                label: const Text(
                  "Get Owner Details",
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(18, 132, 142, 1),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  if (toAuthWrap(context)) {
                    showReportTile(context, property.id);
                  }
                },
                icon: const Icon(
                  Icons.flag,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyDetailsPageTablet extends StatelessWidget {
  final PropertyEntity property;

  const PropertyDetailsPageTablet({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PropertyDetailHeaderTablet(property: property),
          PropertyOverviewWidgetsTablet(property: property),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (toAuthWrap(context)) {
                    showOwnerTile(context, property);
                  }
                },
                icon: const Icon(Icons.info),
                label: const Text(
                  "Get Owner Details",
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(18, 132, 142, 1),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  if (toAuthWrap(context)) {
                    showReportTile(context, property.id);
                  }
                },
                icon: const Icon(
                  Icons.flag,
                ),
              ),
            ),
          ],
        ),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Row(
                        children: [
                          PropertyImageCollageWidgetDesktop(
                            imageList: property.picsUrl,
                          ),
                          PropertyHighlightsWidget(
                            property: property,
                          ),
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
