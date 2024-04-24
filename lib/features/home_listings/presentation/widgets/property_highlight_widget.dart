import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/home_listings/presentation/manager/report_property/report_property_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/widgets/property_image_college.dart';
import 'package:gharmart/utils/constants.dart';
import 'package:intl/intl.dart';

import '../../../panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';

class PropertyHighlightsWidget extends StatelessWidget {
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
                title: Text(property.bhkType,
                  style: TextStyle(color: Theme.of(context).primaryColor),),
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
                title: Text(property.prefTene,
                  style: TextStyle(color: Theme.of(context).primaryColor),),
                subtitle: const Text("Preferred Tenants"),
                leading: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              InfoTile(
                title: Text(property.parking,
                  style: TextStyle(color: Theme.of(context).primaryColor),),
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
                title: Text("${property.bathNo}",
                  style: TextStyle(color: Theme.of(context).primaryColor),),
                subtitle: const Text("No of Bathrooms"),
                leading: Icon(
                  Icons.bathtub,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              InfoTile(
                title: Text("Floor No ${property.floorNo}",
                  style: TextStyle(color: Theme.of(context).primaryColor),),
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
                title: Text(property.water,
                  style: TextStyle(color: Theme.of(context).primaryColor),),
                subtitle: const Text("Water Supply"),
                leading: Icon(
                  Icons.water_drop,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const VerticalDivider(width: 10, thickness: 1),
              InfoTile(
                title: Text(property.gatedSecu ? "Yes" : "No",
                  style: TextStyle(color: Theme.of(context).primaryColor),),
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
                title: Text(property.facing,
                  style: TextStyle(color: Theme.of(context).primaryColor),),
                subtitle: const Text("Facing"),
                leading: Icon(
                  Icons.explore,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              InfoTile(
                title: Text(property.nonveg ? "Yes" : "No",
                  style: TextStyle(color: Theme.of(context).primaryColor),),
                subtitle: const Text("Non-Veg Allowed"),
                leading: Icon(
                  Icons.dinner_dining,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Row(
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
                child: AddToFavoriteButton(property: property),
              ),
            ],
          ),
          const Divider(),
          BlocListener<ReportPropertyCubit, ReportPropertyState>(
            listener: (context, state) {
              if (state is ReportPropertySuccess) {
                MyConstants.mySnackBar(
                  context,
                  message: "Report Submitted Successfully !",
                  color: Colors.indigo,
                );
              }
            },
            child: ListTile(
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(25),
              // ),
              minLeadingWidth: 20,
              tileColor: Colors.grey.shade200,
              leading: const Icon(Icons.flag),
              title: const Text("Report what was not correct in this property"),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (toAuthWrap(context)) {
                          context.read<ReportPropertyCubit>().submitReport(
                                property.id,
                                "Listed By Broker",
                              );
                        }
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("Listed By Broker"),
                    ),
                    TextButton(
                      onPressed: () {
                        if (toAuthWrap(context)) {
                          context.read<ReportPropertyCubit>().submitReport(
                                property.id,
                                "Rented Out",
                              );
                        }
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("Rented out"),
                    ),
                    TextButton(
                      onPressed: () {
                        if (toAuthWrap(context)) {
                          context.read<ReportPropertyCubit>().submitReport(
                                property.id,
                                "Wrong Info",
                              );
                        }
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("Wrong Info"),
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

  const PropertyHighlightsWidget({
    super.key,
    required this.property,
  });
}

class PropertyOverviewWidgetsMobile extends StatelessWidget {
  const PropertyOverviewWidgetsMobile({
    super.key,
    required this.property,
  });

  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          PropertyImageCarouselWidgetMobile(imageList: property.picsUrl),
          // PropertyImageCollageWidgetMobile(
          //   imageList: property.picsUrl,
          // ),
          InfoTileMobile(
            leading: const Icon(Icons.currency_rupee),
            title: Text(property.propertyType == "Rent"
                ? "${property.rentPrice}"
                : "${property.sellPrice}"),
            subtitle: property.propertyType == "Rent"
                ? Text("${property.propertyType}"
                    "${property.rentNego ? "(Negotiable)" : ""}")
                : Text("${property.propertyType}"
                    "${property.sellNego ? "(Negotiable)" : ""}"),
          ),
          InfoTileMobile(
            leading: const Icon(Icons.currency_rupee_outlined),
            title: Text("${property.deposit}"),
            subtitle: const Text(
              "Deposit",
            ),
          ),
          InfoTileMobile(
            title: Text("${property.furnishing} Furnished"),
            subtitle: const Text("Furnishing"),
            leading: const Icon(Icons.chair),
          ),
          InfoTileMobile(
            title: Text(property.bhkType),
            subtitle: const Text("Apartment Type"),
            leading: const Icon(Icons.apartment),
          ),
          InfoTileMobile(
            title: Text(property.prefTene),
            subtitle: const Text("Preferred Tenants"),
            leading: const Icon(Icons.person),
          ),
          InfoTileMobile(
            title: Text(property.parking),
            subtitle: const Text("Parking"),
            leading: const Icon(Icons.local_parking),
          ),
          InfoTileMobile(
            title: Text("${property.bathNo}"),
            subtitle: const Text("No of Bathrooms"),
            leading: const Icon(Icons.bathtub),
          ),
          InfoTileMobile(
            title: Text("Floor No ${property.floorNo}"),
            subtitle: const Text("Floor"),
            leading: const Icon(Icons.corporate_fare),
          ),
          InfoTileMobile(
            title: Text(property.water),
            subtitle: const Text("Water Supply"),
            leading: const Icon(Icons.water_drop),
          ),
          InfoTileMobile(
            title: Text(property.gatedSecu ? "Yes" : "No"),
            subtitle: const Text("Gated Security"),
            leading: const Icon(Icons.badge),
          ),
          InfoTileMobile(
            title: Text(property.facing),
            subtitle: const Text("Facing"),
            leading: const Icon(Icons.explore),
          ),
          InfoTileMobile(
            title: Text(property.nonveg ? "Yes" : "No"),
            subtitle: const Text("Non-Veg Allowed"),
            leading: const Icon(Icons.dinner_dining),
          ),
          InfoTileMobile(
            leading: const Icon(Icons.balcony),
            title: Text("${property.balkNo}"),
            subtitle: const Text("Balcony's"),
          ),
          InfoTileMobile(
            leading: const Icon(Icons.handyman),
            title: Text("${property.ment} /M"),
            subtitle: const Text("Maintenance"),
          ),
          InfoTileMobile(
            leading: const Icon(Icons.cake),
            title: Text("${property.age}+ Years"),
            subtitle: const Text("Age"),
          ),
          InfoTileMobile(
            leading: const Icon(Icons.calendar_month_rounded),
            title: Text(DateFormat.yMMMd().format(property.createdAt)),
            subtitle: const Text("Posted On"),
          ),
          InfoTileMobile(
            leading: const Icon(Icons.star),
            title: Text(
              "Amenities",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 20,
                runSpacing: 10,
                children: property.amenities
                    .map((ame) => Chip(label: Text(ame)))
                    .toList(),
              ),
            ),
          ),
          InfoTileMobile(
            leading: const Icon(Icons.insert_drive_file_outlined),
            title: Text(
              "Description",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
            ),
            subtitle: Text(
              property.desc,
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyOverviewWidgetsTablet extends StatelessWidget {
  const PropertyOverviewWidgetsTablet({
    super.key,
    required this.property,
  });

  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          PropertyImageCarouselWidgetTablet(imageList: property.picsUrl),
          // PropertyImageCollageWidgetTablet(
          //   imageList: property.picsUrl,
          // ),
          Row(
            children: [
              InfoTile(
                leading: const Icon(Icons.currency_rupee),
                title: Text(property.propertyType == "Rent"
                    ? "${property.rentPrice}"
                    : "${property.sellPrice}"),
                subtitle: property.propertyType == "Rent"
                    ? Text("${property.propertyType}"
                        "${property.rentNego ? "(Negotiable)" : ""}")
                    : Text("${property.propertyType}"
                        "${property.sellNego ? "(Negotiable)" : ""}"),
              ),
              InfoTile(
                leading: const Icon(Icons.currency_rupee_outlined),
                title: Text("${property.deposit}"),
                subtitle: const Text(
                  "Deposit",
                ),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                title: Text("${property.furnishing} Furnished"),
                subtitle: const Text("Furnishing"),
                leading: const Icon(Icons.chair),
              ),
              const VerticalDivider(width: 10, thickness: 1),
              InfoTile(
                title: Text(property.bhkType),
                subtitle: const Text("Apartment Type"),
                leading: const Icon(Icons.apartment),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                title: Text(property.prefTene),
                subtitle: const Text("Preferred Tenants"),
                leading: const Icon(Icons.person),
              ),
              InfoTile(
                title: Text(property.parking),
                subtitle: const Text("Parking"),
                leading: const Icon(Icons.local_parking),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                title: Text("${property.bathNo}"),
                subtitle: const Text("No of Bathrooms"),
                leading: const Icon(Icons.bathtub),
              ),
              InfoTile(
                title: Text("Floor No ${property.floorNo}"),
                subtitle: const Text("Floor"),
                leading: const Icon(Icons.corporate_fare),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                title: Text(property.water),
                subtitle: const Text("Water Supply"),
                leading: const Icon(Icons.water_drop),
              ),
              const VerticalDivider(width: 10, thickness: 1),
              InfoTile(
                title: Text(property.gatedSecu ? "Yes" : "No"),
                subtitle: const Text("Gated Security"),
                leading: const Icon(Icons.badge),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                title: Text(property.facing),
                subtitle: const Text("Facing"),
                leading: const Icon(Icons.explore),
              ),
              InfoTile(
                title: Text(property.nonveg ? "Yes" : "No"),
                subtitle: const Text("Non-Veg Allowed"),
                leading: const Icon(Icons.dinner_dining),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                leading: const Icon(Icons.balcony),
                title: Text("${property.balkNo}"),
                subtitle: const Text("Balcony's"),
              ),
              InfoTile(
                leading: const Icon(Icons.handyman),
                title: Text("${property.ment} /M"),
                subtitle: const Text("Maintenance"),
              ),
            ],
          ),
          Row(
            children: [
              InfoTile(
                leading: const Icon(Icons.cake),
                title: Text("${property.age}+ Years"),
                subtitle: const Text("Age"),
              ),
              InfoTile(
                leading: const Icon(Icons.calendar_month_rounded),
                title: Text(DateFormat.yMMMd().format(property.createdAt)),
                subtitle: const Text("Posted On"),
              ),
            ],
          ),
          InfoTileMobile(
            leading: const Icon(Icons.star),
            title: Text(
              "Amenities",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 20,
                runSpacing: 10,
                children: property.amenities
                    .map((ame) => Chip(label: Text(ame)))
                    .toList(),
              ),
            ),
          ),
          InfoTileMobile(
            leading: const Icon(Icons.insert_drive_file_outlined),
            title: Text(
              "Description",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
            ),
            subtitle: Text(
              property.desc,
            ),
          ),
        ],
      ),
    );
  }
}
