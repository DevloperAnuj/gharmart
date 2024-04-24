import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';
import 'package:intl/intl.dart';

class SecondHeadRowWidget extends StatelessWidget {
  final PropertyEntity property;

  const SecondHeadRowWidget({super.key, required this.property});

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
          InfoTile(
            leading: Icon(
              Icons.balcony,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "${property.balkNo}",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: const Text("Balcony's"),
          ),
          const VerticalDivider(),
          InfoTile(
            leading: Icon(
              Icons.handyman,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "${property.ment} /M",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: const Text("Maintenance"),
          ),
          const VerticalDivider(),
          InfoTile(
            leading: Icon(
              Icons.cake,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              "${property.age}+ Years",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: const Text("Age"),
          ),
          const VerticalDivider(),
          InfoTile(
            leading: Icon(
              Icons.calendar_month_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              DateFormat.yMMMd().format(property.createdAt),
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: const Text("Posted On"),
          ),
          const VerticalDivider(),
        ],
      ),
    );
  }
}
