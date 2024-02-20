import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/presentation/pages/edit_property_details.dart';
import 'package:go_router/go_router.dart';

import '../../../../home_listings/presentation/pages/property_details_Page.dart';
import '../home_screen_widgets/property_card_widget.dart';

class MyPropertyCardWidgetDesktop extends StatelessWidget {
  const MyPropertyCardWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          const IntrinsicHeight(
            child: Row(
              children: [
                VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  leading: Icon(Icons.currency_rupee),
                  title: Text("9000"),
                  subtitle: Text("Rent"),
                ),
                VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  leading: Icon(Icons.currency_rupee_outlined),
                  title: Text("20000"),
                  subtitle: Text("Deposit"),
                ),
                VerticalDivider(width: 10, thickness: 1),
                InfoTile(
                  leading: Icon(Icons.square_foot),
                  title: Text("9000" " sqft"),
                  subtitle: Text("BuiltUp"),
                ),
                VerticalDivider(width: 10, thickness: 1),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 1),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1568605114967-8130f3a36994?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    fit: BoxFit.cover,
                  ),
                ),
                const VerticalDivider(width: 10, thickness: 1),
                const Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IntrinsicHeight(
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
                            VerticalDivider(width: 10, thickness: 1),
                          ],
                        ),
                      ),
                      Divider(height: 10, thickness: 1),
                      IntrinsicHeight(
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
                            VerticalDivider(width: 10, thickness: 1),
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
          ListTile(
            onTap: () {
              context.pushNamed(EditPropertyDetailsPage.routeName);
            },
            leading: const Icon(Icons.my_location),
            titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
            title: const Text("Home Name and where it located"),
            subtitle:
                const Text("Home Address full and city state with PinCode"),
            trailing: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}