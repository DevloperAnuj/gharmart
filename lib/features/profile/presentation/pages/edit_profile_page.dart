import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  static const String routeName = "editprofile";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.person_search_outlined,
          size: 75,
        ),
      ),
    );
  }
}
