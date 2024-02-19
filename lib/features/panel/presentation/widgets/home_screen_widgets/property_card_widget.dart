import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/presentation/pages/property_details_Page.dart';
import 'package:go_router/go_router.dart';

class PropertyCardWidgetMobile extends StatelessWidget {
  const PropertyCardWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: const SizedBox(),
      ),
    );
  }
}

class PropertyCardWidgetTablet extends StatelessWidget {
  const PropertyCardWidgetTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: const Card(),
    );
  }
}

///////////////////////////////////////////////////////////////

class PropertyCardWidgetDesktop extends StatelessWidget {
  const PropertyCardWidgetDesktop({super.key});

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
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                            VerticalDivider(width: 10, thickness: 1),
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
                            VerticalDivider(width: 10, thickness: 1),
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
                                  backgroundColor:
                                      const Color.fromRGBO(18, 132, 142, 1),
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
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: () {},
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
          ListTile(
            onTap: () {
              GoRouter.of(context).push(PropertyDetailsPage.routeName);
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
            trailing: const Icon(Icons.open_in_new),
          ),
        ],
      ),
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
