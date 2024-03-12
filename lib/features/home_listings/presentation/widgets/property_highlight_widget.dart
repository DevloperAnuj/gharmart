import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';

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
          const Divider(height: 10, thickness: 1),
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
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
           IntrinsicHeight(
            child: Row(
              children: [
                InfoTile(
                  title: Text("${property.bathNo}"),
                  subtitle: const Text("No of Bathrooms"),
                  leading: const Icon(Icons.bathtub),
                ),
                const VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  title: Text("Floor No ${property.floorNo}"),
                  subtitle: const Text("Floor"),
                  leading: const Icon(Icons.corporate_fare),
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
           IntrinsicHeight(
            child: Row(
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
          ),
          const Divider(height: 10, thickness: 1),
           IntrinsicHeight(
            child: Row(
              children: [
                InfoTile(
                  title: Text(property.facing),
                  subtitle: const Text("Facing"),
                  leading: const Icon(Icons.explore),
                ),
                const VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  title: Text(property.nonveg ? "Yes" : "No"),
                  subtitle: const Text("Non-Veg Allowed"),
                  leading: const Icon(Icons.dinner_dining),
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: ElevatedButton.icon(
                    onPressed: () {},
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_add_outlined,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
          ListTile(
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
          const Divider(height: 10, thickness: 1),
        ],
      ),
    );
  }

  const PropertyHighlightsWidget({super.key,
    required this.property,
  });
}
