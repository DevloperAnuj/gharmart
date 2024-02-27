import 'package:flutter/material.dart';
import 'package:gharmart/features/properties/presentation/pages/add_property_page.dart';
import 'package:go_router/go_router.dart';

import 'my_listing_info_tile.dart';

class DashInfoWidget extends StatelessWidget {
  const DashInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "My Listings",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 22,
                    ),
              ),
            ),
            const Divider(),
            MyListingInfoTile(
              title: '1',
              subTitle: 'Approved',
              iconData: Icons.check_circle,
              colour: Colors.green.shade200,
            ),
            const Divider(),
            MyListingInfoTile(
              title: '2',
              subTitle: 'Pending',
              iconData: Icons.pending_actions,
              colour: Colors.yellow.shade200,
            ),
            const Divider(),
            MyListingInfoTile(
              title: '0',
              subTitle: 'WithHeld',
              iconData: Icons.error,
              colour: Colors.orange.shade200,
            ),
            const Divider(),
            MyListingInfoTile(
              title: '1',
              subTitle: 'Delisted',
              iconData: Icons.delete,
              colour: Colors.red.shade200,
            ),
            const Divider(),
            const Divider(),
            ElevatedButton.icon(
              onPressed: () {
                context.pushNamed(AddPropertyPage.routeName);
              },
              icon: const Icon(Icons.add_home_rounded),
              label: const Text("Add New Property"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
