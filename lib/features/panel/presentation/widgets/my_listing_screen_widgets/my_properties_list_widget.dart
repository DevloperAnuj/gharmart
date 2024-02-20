import 'package:flutter/material.dart';
import 'package:gharmart/features/panel/presentation/widgets/my_listing_screen_widgets/my_property_card_widget.dart';


class MyPropertiesListWidgetDesktop extends StatelessWidget {
  const MyPropertiesListWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (c, i) {
              return const MyPropertyCardWidgetDesktop();
            },
          ),
        ),
      ),
    );
  }
}
