import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';

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
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VerticalDivider(),
            InfoTile(
              leading: Icon(Icons.balcony),
              title: Text("${property.balkNo}"),
              subtitle: Text("Balcony's"),
            ),
            VerticalDivider(),
            InfoTile(
              leading: Icon(Icons.handyman),
              title: Text("${property.ment} /M"),
              subtitle: Text("Maintenance"),
            ),
            VerticalDivider(),
            InfoTile(
              leading: Icon(Icons.cake),
              title: Text("${property.age}+ Years"),
              subtitle: Text("Age"),
            ),
            VerticalDivider(),
            InfoTile(
              leading: Icon(Icons.calendar_month_rounded),
              title: Text(property.createdAt.day.toString()),
              subtitle: Text("Posted On"),
            ),
            VerticalDivider(),
          ],
        ),
      ),
    );
  }
}
