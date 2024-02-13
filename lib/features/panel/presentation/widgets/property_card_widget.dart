import 'package:flutter/material.dart';

class PropertyCardWidgetMobile extends StatelessWidget {
  const PropertyCardWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Card(
        child: SizedBox(
          height: 500,
          width: 350,
        ),
      ),
    );
  }
}

class PropertyCardWidgetTablet extends StatelessWidget {
  const PropertyCardWidgetTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Card(
        child: SizedBox(
          height: 400,
          width: 700,
        ),
      ),
    );
  }
}

class PropertyCardWidgetDesktop extends StatelessWidget {
  const PropertyCardWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          height: 470,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardInfoWidget(
                    price: "1000",
                    type: "Rent",
                    negotiable: true,
                    icon: Icons.currency_rupee,
                  ),
                  CardInfoWidget(
                    price: "100000",
                    type: "Deposit",
                    negotiable: true,
                    icon: Icons.monetization_on,
                  ),
                  CardInfoWidget(
                    price: "1200",
                    type: "Sqft Area BuildUp",
                    icon: Icons.filter_b_and_w,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 250,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1568605114967-8130f3a36994?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CardInfoWidget(
                                price: "Fully Furnished",
                                type: "Furnished",
                                icon: Icons.chair,
                              ),
                              CardInfoWidget(
                                price: "1 BHK",
                                type: "Property Type",
                                icon: Icons.apartment,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CardInfoWidget(
                                price: "Family",
                                type: "Preferred Tenet",
                                icon: Icons.person,
                              ),
                              CardInfoWidget(
                                price: "2 Wheeler",
                                type: "Parking",
                                icon: Icons.local_parking,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const CardInfoWidget(
                price: "Building Name",
                type: "Full Area Address with Pincode and Other Things",
                icon: Icons.filter_b_and_w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardInfoWidget extends StatelessWidget {
  final String price;
  final String type;
  final bool negotiable;
  final IconData icon;

  const CardInfoWidget({
    super.key,
    required this.price,
    required this.type,
    required this.icon,
    this.negotiable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Icon(icon),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontFamily: 'Inter',
                        letterSpacing: 0,
                        height: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$type ${negotiable ? "(Negotiable)" : ""}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[600],
                        fontFamily: 'Inter',
                        letterSpacing: 0,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////

class PropertyCardWidgetNew extends StatelessWidget {
  const PropertyCardWidgetNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          const IntrinsicHeight(
            child: Row(
              children: [
                VerticalDivider(width: 10, thickness: 1),
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.currency_rupee),
                    title: Text("9000"),
                    subtitle: Text("Rent"),
                  ),
                ),
                VerticalDivider(width: 10, thickness: 1),
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.monetization_on),
                    title: Text("9000"),
                    subtitle: Text("Deposit"),
                  ),
                ),
                VerticalDivider(width: 10, thickness: 1),
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.square_foot),
                    title: Text("9000"),
                    subtitle: Text("BuiltUp"),
                  ),
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
                            Expanded(
                              child: ListTile(
                                title: Text("Semi Furnished"),
                                subtitle: Text("Furnishing"),
                                leading: Icon(Icons.chair),
                              ),
                            ),
                            VerticalDivider(width: 10, thickness: 1),
                            Expanded(
                              child: ListTile(
                                title: Text("2 BHK"),
                                subtitle: Text("Apartment Type"),
                                leading: Icon(Icons.apartment),
                              ),
                            ),
                            VerticalDivider(width: 10, thickness: 1),
                          ],
                        ),
                      ),
                      const Divider(height: 10, thickness: 1),
                      const IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text("Family"),
                                subtitle: Text("Preferred Tenants"),
                                leading: Icon(Icons.person),
                              ),
                            ),
                            VerticalDivider(width: 10, thickness: 1),
                            Expanded(
                              child: ListTile(
                                title: Text("4-Wheeler"),
                                subtitle: Text("Parking"),
                                leading: Icon(Icons.local_parking),
                              ),
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
                                  backgroundColor: Colors.indigoAccent,
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
          const ListTile(
            leading: Icon(Icons.my_location),
            title: Text("9000"),
            subtitle: Text("BuiltUp"),
          ),
        ],
      ),
    );
  }
}
