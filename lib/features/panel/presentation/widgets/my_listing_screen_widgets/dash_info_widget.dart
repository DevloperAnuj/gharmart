import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/properties/presentation/pages/add_property_page.dart';
import 'package:go_router/go_router.dart';

import '../../../../home_listings/presentation/manager/get_user_properties/get_user_properties_cubit.dart';
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
                "My Total Listings " "(${context.watch<GetUserPropertiesCubit>().state.properties.length})",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 22,
                    ),
              ),
            ),
            const Divider(),
            MyListingInfoTile(
              title:
                  "${context.watch<GetUserPropertiesCubit>().state.properties.where((property) => property.status == 0).toList().length}",
              subTitle: 'Approved',
              iconData: Icons.check_circle,
              colour: Colors.green.shade200,
            ),
            const Divider(),
            MyListingInfoTile(
              title: "${context.watch<GetUserPropertiesCubit>().state.properties.where((property) => property.status == 1).toList().length}",
              subTitle: 'Pending',
              iconData: Icons.pending_actions,
              colour: Colors.yellow.shade200,
            ),
            const Divider(),
            MyListingInfoTile(
              title: "${context.watch<GetUserPropertiesCubit>().state.properties.where((property) => property.status == 2).toList().length}",
              subTitle: 'WithHeld',
              iconData: Icons.error,
              colour: Colors.orange.shade200,
            ),
            const Divider(),
            MyListingInfoTile(
              title: "${context.watch<GetUserPropertiesCubit>().state.properties.where((property) => property.status == 3).toList().length}",
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


class DashInfoWidgetMobile extends StatelessWidget {
  const DashInfoWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
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
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "My Total Listings " "(${context.watch<GetUserPropertiesCubit>().state.properties.length})",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
          const Divider(),
          MyListingInfoTile(
            title:
            "${context.watch<GetUserPropertiesCubit>().state.properties.where((property) => property.status == 0).toList().length}",
            subTitle: 'Approved',
            iconData: Icons.check_circle,
            colour: Colors.green.shade200,
          ),
          const Divider(),
          MyListingInfoTile(
            title: "${context.watch<GetUserPropertiesCubit>().state.properties.where((property) => property.status == 1).toList().length}",
            subTitle: 'Pending',
            iconData: Icons.pending_actions,
            colour: Colors.yellow.shade200,
          ),
          const Divider(),
          MyListingInfoTile(
            title: "${context.watch<GetUserPropertiesCubit>().state.properties.where((property) => property.status == 2).toList().length}",
            subTitle: 'WithHeld',
            iconData: Icons.error,
            colour: Colors.orange.shade200,
          ),
          const Divider(),
          MyListingInfoTile(
            title: "${context.watch<GetUserPropertiesCubit>().state.properties.where((property) => property.status == 3).toList().length}",
            subTitle: 'Delisted',
            iconData: Icons.delete,
            colour: Colors.red.shade200,
          ),
          const Divider(),
        ],
      ),
    );
  }
}