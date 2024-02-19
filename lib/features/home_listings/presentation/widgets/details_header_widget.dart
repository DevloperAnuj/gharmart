import 'package:flutter/material.dart';


class DetailsHeaderWidgetDesktop extends StatelessWidget {
  const DetailsHeaderWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const VerticalDivider(),
            const Icon(Icons.home_filled, size: 50),
            const VerticalDivider(),
            Expanded(
              flex: 3,
              child: ListTile(
                titleTextStyle:
                Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                title: const Text("Home Name and where it located"),
                subtitle: const Text(
                    "Home Address full and city state with PinCode"),
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 1,
              child: ListTile(
                leading: const Icon(Icons.currency_rupee_outlined),
                titleTextStyle:
                Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                title: const Text("9000 /M"),
                subtitle: const Text("Negotiable"),
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 1,
              child: ListTile(
                leading: const Icon(Icons.square_foot),
                titleTextStyle:
                Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                title: const Text("600 sqft"),
                subtitle: const Text("BuildUp"),
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 1,
              child: ListTile(
                leading: const Icon(Icons.currency_rupee_outlined),
                titleTextStyle:
                Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                title: const Text("20000"),
                subtitle: const Text(
                    "Deposit"),
              ),
            ),
            const VerticalDivider(),
          ],
        ),
      ),
    );
  }
}