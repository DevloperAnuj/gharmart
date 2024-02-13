import 'package:flutter/material.dart';
import 'package:gharmart/features/panel/presentation/widgets/property_card_widget.dart';

class PropertiesListWidgetMobile extends StatelessWidget {
  const PropertiesListWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 650,
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (c, i) {
              return const PropertyCardWidgetMobile();
            },
          ),
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 800,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (c, i) {
              return const PropertyCardWidgetTablet();
            },
          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (c, i) {
            return const PropertyCardWidgetNew();
          },
        ),
      ),
    );
  }
}
