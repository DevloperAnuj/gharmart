import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/home_listings/presentation/manager/favorite_property/favorite_property_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/pages/property_details_Page.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_connections/fetch_connections_cubit.dart';
import 'package:gharmart/features/profile/presentation/pages/connections_property_page.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/config_file.dart';
import '../../../../../utils/constants.dart';
import '../../../../home_listings/presentation/manager/report_property/report_property_cubit.dart';

class PropertyCardWidgetMobile extends StatelessWidget {
  final PropertyEntity property;

  const PropertyCardWidgetMobile({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          Image.network(
            property.picsUrl.first,
            height: 250,
            fit: BoxFit.cover,
          ),
          ListTile(
            onTap: () {
              context.pushNamed(PropertyDetailsPage.routeName, extra: property);
            },
            title: Text(
              property.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            subtitle: Text(
              property.address,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
            ),
            trailing: context
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
                      "Get Owner",
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(18, 132, 142, 1),
                      foregroundColor: Colors.white,
                    ),
                  ),
          ),
          const Divider(),
          Row(
            children: [
              HighLightRow(
                title: property.propertyType == "Rent"
                    ? "${property.rentPrice} /-"
                    : "${property.sellPrice} /-",
                subTitle: property.propertyType,
              ),
              HighLightRow(
                title: "${property.deposit} /-",
                subTitle: "Deposit",
              ),
              HighLightRow(
                title: "${property.area} sqft",
                subTitle: "Built Area",
              ),
              HighLightRow(
                title: property.prefTene,
                subTitle: "Pref. Tenet",
              ),
              AddToFavoriteButton(property: property),
            ],
          ),
        ],
      ),
    );
  }
}

class HighLightRow extends StatelessWidget {
  final String title;
  final String subTitle;

  const HighLightRow({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListTile(
        dense: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 9,
              ),
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 8,
              ),
        ),
      ),
    );
  }
}

class PropertyCardWidgetTablet extends StatelessWidget {
  final PropertyEntity property;

  const PropertyCardWidgetTablet({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              context.pushNamed(PropertyDetailsPage.routeName, extra: property);
            },
            title: Text(
              property.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            subtitle: Text(
              property.address,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
            ),
            trailing: AddToFavoriteButton(property: property),
          ),
          Image.network(
            property.picsUrl.first,
            height: 250,
            fit: BoxFit.cover,
          ),
          ListTile(
            leading: const Icon(Icons.currency_rupee_outlined),
            title: Text(
              property.propertyType == "Rent"
                  ? property.rentPrice.toString()
                  : property.sellPrice.toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            subtitle: Text(
              "${property.propertyType}"
              "\n${property.propertyType == "Rent" ? property.rentNego ? "(Negotiable)" : "" : property.sellNego ? "(Negotiable)" : ""}",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
            ),
            trailing: context
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
          const Divider(),
          const Row(
            children: [],
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////

class PropertyCardWidgetDesktop extends StatelessWidget {
  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              context.pushNamed(PropertyDetailsPage.routeName, extra: property);
            },
            leading: const Icon(Icons.my_location),
            titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
            title: Text(property.title),
            subtitle: Text(property.address),
            trailing: const Icon(Icons.open_in_new),
          ),
          const Divider(height: 10, thickness: 1),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                    property.picsUrl.first,
                    fit: BoxFit.cover,
                    height: 225,
                  ),
                ),
                const VerticalDivider(width: 10, thickness: 1),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IntrinsicHeight(
                        child: Row(
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
                            const VerticalDivider(width: 10, thickness: 1),
                          ],
                        ),
                      ),
                      const Divider(height: 10, thickness: 1),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            InfoTile(
                              title: Text(property.prefTene),
                              subtitle: const Text("Preferred Tenants"),
                              leading: const Icon(Icons.person),
                            ),
                            const VerticalDivider(width: 10, thickness: 1),
                            InfoTile(
                              title: Text(property.parking),
                              subtitle: const Text("Parking"),
                              leading: const Icon(Icons.local_parking),
                            ),
                            const VerticalDivider(width: 10, thickness: 1),
                          ],
                        ),
                      ),
                      const Divider(height: 10, thickness: 1),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            context
                                    .watch<FetchConnectionsCubit>()
                                    .state
                                    .connectionList
                                    .any((myProperty) =>
                                        myProperty.id == property.id)
                                ? Expanded(
                                    flex: 4,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        showConnectedOwnerTile(
                                            context, property);
                                      },
                                      icon: const Icon(Icons.info),
                                      label: const Text(
                                        "Owner Already Contacted",
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  )
                                : Expanded(
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
                                        backgroundColor: const Color.fromRGBO(
                                            18, 132, 142, 1),
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                            Expanded(
                              flex: 1,
                              child: AddToFavoriteButton(property: property),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
          IntrinsicHeight(
            child: Row(
              children: [
                const VerticalDivider(width: 10, thickness: 1),
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
                const VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  leading: const Icon(Icons.currency_rupee_outlined),
                  title: Text("${property.deposit}"),
                  subtitle: const Text("Deposit"),
                ),
                const VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  leading: const Icon(Icons.square_foot),
                  title: Text("${property.area}" " sqft"),
                  subtitle: const Text("BuiltUp"),
                ),
                const VerticalDivider(width: 10, thickness: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  const PropertyCardWidgetDesktop({
    super.key,
    required this.property,
  });
}

class AddToFavoriteButton extends StatelessWidget {
  const AddToFavoriteButton({
    super.key,
    required this.property,
  });

  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritePropertyCubit, FavoritePropertyState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if (toAuthWrap(context)) {
              context.read<FavoritePropertyCubit>().toggleFavorite(property);
            }
          },
          icon: Icon(
            state.favoritePropertyList
                    .any((element) => element.id == property.id)
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            color: state.favoritePropertyList
                    .any((element) => element.id == property.id)
                ? Colors.red
                : Colors.black,
          ),
        );
      },
    );
  }
}

class InfoTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        minLeadingWidth: 5,
        leading: leading,
        title: title,
        subtitle: subtitle,
        titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
        subtitleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 14,
              color: Colors.black,
            ),
      ),
    );
  }

  const InfoTile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
  });
}

class InfoTileMobile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 5,
      leading: leading,
      title: title,
      subtitle: subtitle,
      titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
      subtitleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 14,
            color: Colors.black,
          ),
    );
  }

  const InfoTileMobile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
  });
}

void showReportTile(BuildContext context, String id) {
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return BlocProvider.value(
        value: serviceConfig.get<ReportPropertyCubit>(),
        child: Builder(builder: (context) {
          return AlertDialog.adaptive(
            icon: const Icon(Icons.flag),
            title: const Text("Report Property"),
            content: BlocListener<ReportPropertyCubit, ReportPropertyState>(
              listener: (context, state) {
                if (state is ReportPropertySuccess) {
                  Navigator.pop(context);
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
                title:
                    const Text("Report what was not correct in this property"),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          context
                              .read<ReportPropertyCubit>()
                              .submitReport(id, "Listed By Broker");
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
                          context
                              .read<ReportPropertyCubit>()
                              .submitReport(id, "Rented Out");
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
                          context
                              .read<ReportPropertyCubit>()
                              .submitReport(id, "Wrong Info");
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
          );
        }),
      );
    },
  );
}
