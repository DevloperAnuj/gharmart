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
                subtitle:
                    const Text("Home Address full and city state with PinCode"),
              ),
            ),
            const VerticalDivider(),
            const HeaderInfoTile(
              leading: Icon(Icons.square_foot),
              title: Text("9000 /M"),
              subtitle: Text("Rent"),
            ),
            const VerticalDivider(),
            const HeaderInfoTile(
              leading: Icon(Icons.square_foot),
              title: Text("600 sqft"),
              subtitle: Text("BuildUp"),
            ),
            const VerticalDivider(),
            const HeaderInfoTile(
              leading: Icon(Icons.currency_rupee_outlined),
              title: Text("20000"),
              subtitle: Text(
                "Deposit",
              ),
            ),
            const VerticalDivider(),
          ],
        ),
      ),
    );
  }
}

class HeaderInfoTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListTile(
        leading: leading,
        titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
        title: FittedBox(fit: BoxFit.scaleDown, child: title),
        subtitle: FittedBox(fit: BoxFit.scaleDown, child: subtitle),
      ),
    );
  }

  const HeaderInfoTile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
  });
}
