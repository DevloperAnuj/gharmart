import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';
import 'package:intl/intl.dart';

class SecondHeadRowWidget extends StatelessWidget {

  final PropertyEntity property;

  const SecondHeadRowWidget({
    super.key,
    required this.property
  });

  @override
  Widget build(BuildContext context) {
    return  IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const VerticalDivider(),
            InfoTile(
              leading: const Icon(Icons.balcony),
              title: Text("${property.balkNo}"),
              subtitle: const Text("Balcony's"),
            ),
            const VerticalDivider(),
            InfoTile(
              leading: const Icon(Icons.handyman),
              title: Text("${property.ment} /M"),
              subtitle: const Text("Maintenance"),
            ),
            const VerticalDivider(),
            InfoTile(
              leading: const Icon(Icons.cake),
              title: Text("${property.age}+ Years"),
              subtitle: const Text("Age"),
            ),
            const VerticalDivider(),
            InfoTile(
              leading: const Icon(Icons.calendar_month_rounded),
              title: Text(DateFormat.yMMMd().format(property.createdAt)),
              subtitle: const Text("Posted On"),
            ),
            const VerticalDivider(),
          ],
        ),
      ),
    );
  }
}
