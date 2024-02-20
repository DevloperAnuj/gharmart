import 'package:flutter/material.dart';

import '../../../panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';

class PropertyHighlightsWidget extends StatelessWidget {
  const PropertyHighlightsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Divider(height: 10, thickness: 1),
          const IntrinsicHeight(
            child: Row(
              children: [
                InfoTile(
                  title: Text("Semi Furnished"),
                  subtitle: Text("Furnishing"),
                  leading: Icon(Icons.chair),
                ),
                VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  title: Text("2 BHK"),
                  subtitle: Text("Apartment Type"),
                  leading: Icon(Icons.apartment),
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
          const IntrinsicHeight(
            child: Row(
              children: [
                InfoTile(
                  title: Text("Family"),
                  subtitle: Text("Preferred Tenants"),
                  leading: Icon(Icons.person),
                ),
                VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  title: Text("4-Wheeler"),
                  subtitle: Text("Parking"),
                  leading: Icon(Icons.local_parking),
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
          const IntrinsicHeight(
            child: Row(
              children: [
                InfoTile(
                  title: Text("2 Bathrooms"),
                  subtitle: Text("No of Bathrooms"),
                  leading: Icon(Icons.bathtub),
                ),
                VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  title: Text("Floor No 2"),
                  subtitle: Text("Floor"),
                  leading: Icon(Icons.corporate_fare),
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
          const IntrinsicHeight(
            child: Row(
              children: [
                InfoTile(
                  title: Text("Corporation"),
                  subtitle: Text("Water Supply"),
                  leading: Icon(Icons.water_drop),
                ),
                VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  title: Text("Yes"),
                  subtitle: Text("Gated Security"),
                  leading: Icon(Icons.badge),
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
          const IntrinsicHeight(
            child: Row(
              children: [
                InfoTile(
                  title: Text("North"),
                  subtitle: Text("Facing"),
                  leading: Icon(Icons.explore),
                ),
                VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  title: Text("Yes"),
                  subtitle: Text("Non-Veg Allowed"),
                  leading: Icon(Icons.dinner_dining),
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
}
