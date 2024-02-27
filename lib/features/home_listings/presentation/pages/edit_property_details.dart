import 'package:flutter/material.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

class EditPropertyDetailsPage extends StatelessWidget {

  static const String routeName = "editproperty";

  const EditPropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyBuilder(
      mobileView: EditPropertyDetailsPageMobile(),
      tabletView: EditPropertyDetailsPageTablet(),
      deskView: EditPropertyDetailsPageDesktop(),
    );
  }
}

class EditPropertyDetailsPageMobile extends StatelessWidget {
  const EditPropertyDetailsPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EditPropertyDetailsPageTablet extends StatelessWidget {
  const EditPropertyDetailsPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EditPropertyDetailsPageDesktop extends StatelessWidget {
  const EditPropertyDetailsPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.edit,
        size: 100,
      ),
    );
  }
}
