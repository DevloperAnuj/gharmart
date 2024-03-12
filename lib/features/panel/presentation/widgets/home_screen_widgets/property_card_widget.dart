import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
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
              context.pushNamed(PropertyDetailsPage.routeName,extra: property);
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
        title: FittedBox(fit: BoxFit.scaleDown, child: title),
        subtitle: FittedBox(fit: BoxFit.scaleDown, child: subtitle),
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
