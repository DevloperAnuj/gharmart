import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/presentation/pages/edit_property_details.dart';
import 'package:go_router/go_router.dart';

import '../../../../home_listings/domain/entities/property_entity.dart';
import '../../../../home_listings/presentation/pages/property_details_Page.dart';
import '../home_screen_widgets/property_card_widget.dart';

class MyPropertyCardWidgetDesktop extends StatelessWidget {
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
            tileColor: getTileStatusColour(property.status),
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
            trailing: const Icon(Icons.remove_red_eye_rounded),
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                          label: const Text(
                            "De-list Property",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade500,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                      // IntrinsicHeight(
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         flex: 4,
                      //         child: ElevatedButton.icon(
                      //           onPressed: () {},
                      //           icon: const Icon(Icons.info),
                      //           label: const Text(
                      //             "De-list Property",
                      //           ),
                      //           style: ElevatedButton.styleFrom(
                      //             backgroundColor: Colors.red,
                      //             foregroundColor: Colors.white,
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         flex: 1,
                      //         child: IconButton(
                      //           onPressed: () {},
                      //           icon: const Icon(
                      //             Icons.bookmark_add_outlined,
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         flex: 1,
                      //         child: IconButton(
                      //           onPressed: () {},
                      //           icon: const Icon(
                      //             Icons.flag,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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

  const MyPropertyCardWidgetDesktop({
    super.key,
    required this.property,
  });
}

class StatusWidget extends StatelessWidget {
  final int status;

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      return const CircleAvatar(
        child: Icon(Icons.approval),
      );
    }
    if (status == 1) {
      return CircleAvatar(
        child: Icon(
          Icons.pending,
          color: Colors.yellow.shade200,
        ),
      );
    }
    if (status == 2) {
      return const CircleAvatar(
        child: Icon(Icons.error_rounded),
      );
    }
    if (status == 3) {
      return const CircleAvatar(
        child: Icon(Icons.delete),
      );
    }
    return const SizedBox.shrink();
  }

  const StatusWidget({
    super.key,
    required this.status,
  });
}

Color getTileStatusColour(int status) {
  if (status == 0) {
    return Colors.green.shade100;
  }
  if (status == 1) {
    return Colors.yellow.shade100;
  }
  if (status == 2) {
    return Colors.orange.shade100;
  }
  if (status == 3) {
    return Colors.red.shade100;
  }
  return Colors.white;
}
