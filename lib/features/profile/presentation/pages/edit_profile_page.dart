import 'package:flutter/material.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

class EditProfilePage extends StatelessWidget {

  const EditProfilePage({super.key});

  static const String routeName = "/editprofile";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyBuilder(
        mobileView: EditProfilePageMobile(),
        tabletView: EditProfilePageTablet(),
        deskView: EditProfilePageDesktop(),
      ),
    );
  }
}

class EditProfilePageMobile extends StatelessWidget {
  const EditProfilePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.person_search_outlined,
        size: 75,
      ),
    );
  }
}

class EditProfilePageTablet extends StatelessWidget {
  const EditProfilePageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.person_search_outlined,
        size: 75,
      ),
    );
  }
}

class EditProfilePageDesktop extends StatelessWidget {
  const EditProfilePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.person_search_outlined,
        size: 75,
      ),
    );
  }
}
