import 'package:flutter/material.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';

class PropertiesListWidgetMobile extends StatelessWidget {
  const PropertiesListWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (c, i) {
            return const PropertyCardWidgetMobile();
          },
        ),
      ),
    );
  }
}

class PropertiesListWidgetTablet extends StatelessWidget {
  const PropertiesListWidgetTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (c, i) {
            return const PropertyCardWidgetTablet();
          },
        ),
      ),
    );
  }
}

class PropertiesListWidgetDesktop extends StatelessWidget {
  const PropertiesListWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (c, i) {
              return const PropertyCardWidgetDesktop();
            },
          ),
        ),
      ),
    );
  }
}
