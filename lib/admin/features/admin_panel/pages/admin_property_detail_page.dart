import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/home_listings/presentation/widgets/second_head_row_widget.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

import '../../../../features/home_listings/presentation/manager/favorite_property/favorite_property_cubit.dart';
import '../../../../features/home_listings/presentation/manager/report_property/report_property_cubit.dart';
import '../../../../features/home_listings/presentation/widgets/description_widget.dart';
import '../../../../features/home_listings/presentation/widgets/details_header_widget.dart';
import '../../../../features/home_listings/presentation/widgets/property_highlight_widget.dart';
import '../../../../features/home_listings/presentation/widgets/property_image_college.dart';
import '../../../../features/panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';
import '../../../../features/profile/presentation/manager/fetch_connections/fetch_connections_cubit.dart';
import '../../../../utils/config_file.dart';

class AdminPropertyDetailsPage extends StatelessWidget {
  final PropertyEntity property;

  static const String routeName = "/adminpropertydetail";

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
      ],
      child: PropertyDetailsPageDesktop(
        property: property,
      ),
    );
  }

  const AdminPropertyDetailsPage({
    super.key,
    required this.property,
  });
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
                          AdminPropertyHighlightsWidget(
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

class AdminPropertyHighlightsWidget extends StatelessWidget {
  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              InfoTile(
                title: Text(
                  "${property.furnishing} Furnished",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: const Text("Furnishing"),
                leading: Icon(
                  Icons.chair,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const VerticalDivider(width: 10, thickness: 1),
              InfoTile(
                title: Text(
                  property.bhkType,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: const Text("Apartment Type"),
                leading: Icon(
                  Icons.apartment,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                title: Text(
                  property.prefTene,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: const Text("Preferred Tenants"),
                leading: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              InfoTile(
                title: Text(
                  property.parking,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: const Text("Parking"),
                leading: Icon(
                  Icons.local_parking,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                title: Text(
                  "${property.bathNo}",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: const Text("No of Bathrooms"),
                leading: Icon(
                  Icons.bathtub,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              InfoTile(
                title: Text(
                  "Floor No ${property.floorNo}",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: const Text("Floor"),
                leading: Icon(
                  Icons.corporate_fare,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                title: Text(
                  property.water,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: const Text("Water Supply"),
                leading: Icon(
                  Icons.water_drop,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const VerticalDivider(width: 10, thickness: 1),
              InfoTile(
                title: Text(
                  property.gatedSecu ? "Yes" : "No",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: const Text("Gated Security"),
                leading: Icon(
                  Icons.badge,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                title: Text(
                  property.facing,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: const Text("Facing"),
                leading: Icon(
                  Icons.explore,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              InfoTile(
                title: Text(
                  property.nonveg ? "Yes" : "No",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: const Text("Non-Veg Allowed"),
                leading: Icon(
                  Icons.dinner_dining,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const Divider(),
          ListTile(
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(25),
            // ),
            minLeadingWidth: 20,
            tileColor: Colors.grey.shade200,
            leading: const Icon(Icons.person),
            title: const Text("Owner Info"),
            subtitle: SelectableText(
              "🙋🏻‍:️ ${property.user.name}"
              "\n📞: ${property.user.phone}"
              "\n📧: ${property.user.email}"
              "\n📍: ${property.user.city}"
              "\n🌟: ${property.user.tokens}",
            ),
          ),
        ],
      ),
    );
  }

  const AdminPropertyHighlightsWidget({
    super.key,
    required this.property,
  });
}
