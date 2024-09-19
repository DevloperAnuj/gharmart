import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/utils/constants.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/home_listings/domain/entities/property_entity.dart';
import '../../../../features/panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';
import '../manager/fetch_admin_properties/fetch_admin_properties_cubit.dart';
import '../pages/admin_property_detail_page.dart';

import 'package:flutter/services.dart';

class AdminPropertyCardWidget extends StatelessWidget {
  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                context.pushNamed(AdminPropertyDetailsPage.routeName,
                    extra: property);
              },
              leading: const Icon(Icons.my_location),
              titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
              title: Text(
                property.title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text(property.address),
              trailing: Icon(
                Icons.open_in_new,
                color: Theme.of(context).primaryColor,
              ),
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
                      height: 235,
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
                                title: Text(
                                  "${property.furnishing} Furnished",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                subtitle: const Text("Furnishing"),
                                leading: Icon(
                                  Icons.chair,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const VerticalDivider(width: 10, thickness: 1),
                              InfoTile(
                                title: Text(
                                  property.bhkType,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                subtitle: const Text("Apartment Type"),
                                leading: Icon(
                                  Icons.apartment,
                                  color: Theme.of(context).primaryColor,
                                ),
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
                                title: Text(
                                  property.prefTene,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                subtitle: const Text("Preferred Tenants"),
                                leading: Icon(
                                  Icons.person,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const VerticalDivider(width: 10, thickness: 1),
                              InfoTile(
                                title: Text(
                                  property.parking,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                subtitle: const Text("Parking"),
                                leading: Icon(
                                  Icons.local_parking,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const VerticalDivider(width: 10, thickness: 1),
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
                          leading: const Icon(Icons.pending_actions),
                          title: const Text("Take Action About Property"),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                if (property.status != 3)
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<FetchAdminPropertiesCubit>()
                                          .takingActionOnProperty(property, 3);
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text("De-list Property"),
                                  ),
                                if (property.status != 2)
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<FetchAdminPropertiesCubit>()
                                          .takingActionOnProperty(property, 2);
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text("Withheld Property"),
                                  ),
                                if (property.status != 0)
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<FetchAdminPropertiesCubit>()
                                          .takingActionOnProperty(property, 0);
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text("Approve Property"),
                                  ),
                                TextButton(
                                  onPressed: () async {
                                    await Clipboard.setData(
                                      ClipboardData(
                                        text:
                                            "https://gharmarket.com/#/propertydetailById/${property.id}",
                                      ),
                                    ).then((value) {
                                      MyConstants.mySnackBar(
                                        context,
                                        message: "Property Link Copied !",
                                        color: Colors.green,
                                      );
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          const BorderSide(color: Colors.black),
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: const Text("Copy Link"),
                                ),
                              ],
                            ),
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
                    leading: Icon(
                      Icons.currency_rupee,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      property.propertyType == "Rent"
                          ? "${property.rentPrice}"
                          : "${property.sellPrice}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    subtitle: property.propertyType == "Rent"
                        ? Text("${property.propertyType}"
                            "${property.rentNego ? "(Negotiable)" : ""}")
                        : Text("${property.propertyType}"
                            "${property.sellNego ? "(Negotiable)" : ""}"),
                  ),
                  const VerticalDivider(width: 10, thickness: 1),
                  InfoTile(
                    leading: Icon(
                      Icons.currency_rupee_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "${property.deposit}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    subtitle: const Text("Deposit"),
                  ),
                  const VerticalDivider(width: 10, thickness: 1),
                  InfoTile(
                    leading: Icon(
                      Icons.square_foot,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "${property.area}" " sqft",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    subtitle: const Text("BuiltUp"),
                  ),
                  const VerticalDivider(width: 10, thickness: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  const AdminPropertyCardWidget({
    super.key,
    required this.property,
  });
}
