import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_property_by_id/fetch_property_by_id_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/widgets/second_head_row_widget.dart';
import 'package:gharmart/utils/my_layout_builder.dart';
import 'dart:math' as math;

import '../../../../utils/config_file.dart';
import '../../../../utils/constants.dart';
import '../../../panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';
import '../../../profile/presentation/manager/fetch_connections/fetch_connections_cubit.dart';
import '../../../profile/presentation/pages/connections_property_page.dart';
import '../manager/favorite_property/favorite_property_cubit.dart';
import '../manager/report_property/report_property_cubit.dart';
import '../widgets/description_widget.dart';
import '../widgets/details_header_widget.dart';
import '../widgets/property_highlight_widget.dart';
import '../widgets/property_image_college.dart';

class PropertyDetailsByIdPage extends StatelessWidget {
  final String propertyId;

  static const String routeName = "/propertydetailById";

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
        BlocProvider.value(
          value: serviceConfig.get<FetchConnectionsCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<FetchPropertyByIdCubit>()
            ..fetchPropertyById(propertyId),
        ),
      ],
      child: BlocConsumer<FetchPropertyByIdCubit, FetchPropertyByIdState>(
        listener: (context, state) {
          if (state.propertyEntity != null) {
            // if (math.Random().nextBool()) {
            //   MyConstants.mySnackBar(
            //     context,
            //     message:
            //         "Server Limit is Reached.To Fix Reduce PID Process or Upgrade Infrastructure",
            //     color: Colors.redAccent,
            //   );
            // }
          }
        },
        builder: (context, state) {
          if (state.propertyEntity != null) {
            return MyBuilder(
              mobileView: PropertyDetailsByIdPageMobile(
                property: state.propertyEntity!,
              ),
              tabletView: PropertyDetailsByIdPageTablet(
                property: state.propertyEntity!,
              ),
              deskView: PropertyDetailsByIdPageDesktop(
                property: state.propertyEntity!,
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  const PropertyDetailsByIdPage({
    super.key,
    required this.propertyId,
  });
}

class PropertyDetailsByIdPageMobile extends StatelessWidget {
  final PropertyEntity property;

  const PropertyDetailsByIdPageMobile({super.key, required this.property});

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
              child: context
                      .watch<FetchConnectionsCubit>()
                      .state
                      .connectionList
                      .any((myProperty) => myProperty.id == property.id)
                  ? ElevatedButton.icon(
                      onPressed: () {
                        showConnectedOwnerTile(context, property);
                      },
                      icon: const Icon(Icons.info),
                      label: const Text(
                        "Contacted",
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    )
                  : ElevatedButton.icon(
                      onPressed: () {
                        if (toAuthWrap(context)) {
                          showOwnerTile(context, property);
                        }
                      },
                      icon: const Icon(Icons.info),
                      label: const Text(
                        "Owner Details",
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

class PropertyDetailsByIdPageTablet extends StatelessWidget {
  final PropertyEntity property;

  const PropertyDetailsByIdPageTablet({super.key, required this.property});

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
              child: context
                      .watch<FetchConnectionsCubit>()
                      .state
                      .connectionList
                      .any((myProperty) => myProperty.id == property.id)
                  ? ElevatedButton.icon(
                      onPressed: () {
                        showConnectedOwnerTile(context, property);
                      },
                      icon: const Icon(Icons.info),
                      label: const Text(
                        "Contacted",
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    )
                  : ElevatedButton.icon(
                      onPressed: () {
                        if (toAuthWrap(context)) {
                          showOwnerTile(context, property);
                        }
                      },
                      icon: const Icon(Icons.info),
                      label: const Text(
                        "Owner Details",
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

class PropertyDetailsByIdPageDesktop extends StatelessWidget {
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

  const PropertyDetailsByIdPageDesktop({
    super.key,
    required this.property,
  });
}
