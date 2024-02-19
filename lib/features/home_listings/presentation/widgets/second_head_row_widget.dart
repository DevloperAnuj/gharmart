import 'package:flutter/material.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';

class SecondHeadRowWidget extends StatelessWidget {

  const SecondHeadRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
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
              title: Text("2"),
              subtitle: Text("Balcony's"),
            ),
            VerticalDivider(),
            InfoTile(
              leading: Icon(Icons.handyman),
              title: Text("9000 /M"),
              subtitle: Text("Maintenance"),
            ),
            VerticalDivider(),
            InfoTile(
              leading: Icon(Icons.cake),
              title: Text("5+ Years"),
              subtitle: Text("Age"),
            ),
            VerticalDivider(),
            InfoTile(
              leading: Icon(Icons.calendar_month_rounded),
              title: Text("12/12/2023"),
              subtitle: Text("Posted On"),
            ),
            VerticalDivider(),
          ],
        ),
      ),
    );
  }
}
