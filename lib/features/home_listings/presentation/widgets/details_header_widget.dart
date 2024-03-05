import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';

class DetailsHeaderWidgetDesktop extends StatelessWidget {

  final PropertyEntity property;

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
                title: Text(property.title),
                subtitle:
                Text(property.address),
              ),
            ),
            const VerticalDivider(),
             HeaderInfoTile(
              leading: const Icon(Icons.square_foot),
              title: Text(property.propertyType == "Rent"
                  ? "${property.rentPrice}"
                  : "${property.sellPrice}"),
              subtitle: property.propertyType == "Rent"
                  ? Text("${property.propertyType}"
                  "${property.rentNego ? "(Negotiable)" : ""}")
                  : Text("${property.propertyType}"
                  "${property.sellNego ? "(Negotiable)" : ""}"),
            ),
            const VerticalDivider(),
             HeaderInfoTile(
              leading: const Icon(Icons.square_foot),
              title: Text("${property.area} sqft"),
              subtitle: const Text("BuildUp"),
            ),
            const VerticalDivider(),
             HeaderInfoTile(
              leading: const Icon(Icons.currency_rupee_outlined),
              title: Text("${property.deposit}"),
              subtitle: const Text(
                "Deposit",
              ),
            ),
            const VerticalDivider(),
          ],
        ),
      ),
    );
  }

  const DetailsHeaderWidgetDesktop({super.key,
    required this.property,
  });
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
