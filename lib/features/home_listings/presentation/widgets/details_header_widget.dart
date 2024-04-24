import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';

import '../../../panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';

class PropertyDetailHeaderMobile extends StatelessWidget {
  const PropertyDetailHeaderMobile({
    super.key,
    required this.property,
  });

  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_outlined),
      ),
      title: Text(
        property.title,
        maxLines: 2,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
      ),
      subtitle: Text(
        property.address,
        maxLines: 1,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
      ),
      trailing: AddToFavoriteButton(property: property),
    );
  }
}

class PropertyDetailHeaderTablet extends StatelessWidget {
  const PropertyDetailHeaderTablet({
    super.key,
    required this.property,
  });

  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_outlined),
      ),
      title: Text(
        property.title,
        maxLines: 2,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
      ),
      subtitle: Text(
        property.address,
        maxLines: 1,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
      ),
      trailing: AddToFavoriteButton(property: property),
    );
  }
}

class DetailsHeaderWidgetDesktop extends StatelessWidget {
  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const VerticalDivider(),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          const VerticalDivider(),
          Expanded(
            flex: 3,
            child: ListTile(
              titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
              title: Text(property.title),
              subtitle: Text(property.address),
            ),
          ),
          const VerticalDivider(),
          HeaderInfoTile(
            leading: const Icon(Icons.square_foot, color: Colors.white),
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
            leading: const Icon(
              Icons.square_foot,
              color: Colors.white,
            ),
            title: Text("${property.area} sqft"),
            subtitle: const Text("BuildUp"),
          ),
          const VerticalDivider(),
          HeaderInfoTile(
            leading: const Icon(
              Icons.currency_rupee_outlined,
              color: Colors.white,
            ),
            title: Text("${property.deposit}"),
            subtitle: const Text(
              "Deposit",
            ),
          ),
          const VerticalDivider(),
        ],
      ),
    );
  }

  const DetailsHeaderWidgetDesktop({
    super.key,
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
        tileColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: leading,
        titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        subtitleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        title: title,
        subtitle: subtitle,
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
