import 'package:flutter/material.dart';

import '../widgets/profile_screen_widgets/membership_card_widget.dart';
import '../widgets/profile_screen_widgets/profile_widget.dart';
import '../widgets/profile_screen_widgets/purchase_token_widget.dart';
import '../widgets/profile_screen_widgets/remaining_token_widget.dart';

class ProfileScreenMobile extends StatelessWidget {

  const ProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileWidgetMobile(),
            const RemainingTokensWidget(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Purchase Membership Connections",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const MembershipCard(
              cardColour: Colors.yellow,
              membershipName: "Gold",
              membershipPrice: "1000",
              membershipInfo: "You Will Get 60 Connections",
            ),
            const MembershipCard(
              cardColour: Colors.blueAccent,
              membershipName: "Silver",
              membershipPrice: "500",
              membershipInfo: "You Will Get 25 Connections",
            ),
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
    return  Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileWidgetMobile(),
            const RemainingTokensWidget(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Purchase Membership Connections",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const MembershipCard(
              cardColour: Colors.yellow,
              membershipName: "Gold",
              membershipPrice: "1000",
              membershipInfo: "You Will Get 60 Connections",
            ),
            const MembershipCard(
              cardColour: Colors.blueAccent,
              membershipName: "Silver",
              membershipPrice: "500",
              membershipInfo: "You Will Get 25 Connections",
            ),
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
        PurchaseTokensWidget(),
      ],
    );
  }
}
