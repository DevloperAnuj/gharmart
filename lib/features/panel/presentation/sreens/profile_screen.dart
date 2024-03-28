import 'package:flutter/material.dart';

import '../widgets/profile_screen_widgets/membership_card_widget.dart';
import '../widgets/profile_screen_widgets/profile_widget.dart';
import '../widgets/profile_screen_widgets/purchase_token_widget.dart';
import '../widgets/profile_screen_widgets/remaining_token_widget.dart';

class ProfileScreenMobile extends StatelessWidget {
  const ProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileWidgetMobile(),
          ],
        ),
      ),
    );
  }
}

class ProfileScreenTablet extends StatelessWidget {
  const ProfileScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileWidgetMobile(),
          ],
        ),
      ),
    );
  }
}

class ProfileScreenDesktop extends StatelessWidget {
  const ProfileScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ProfileWidgetDesktop(),
        VerticalDivider(),
        Expanded(
          flex: 2,
          child: SizedBox(),
        ),
      ],
    );
  }
}
