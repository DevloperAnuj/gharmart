import 'package:flutter/material.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/my_app_bar.dart';

import 'membership_card_widget.dart';
import 'remaining_token_widget.dart';

class PurchaseTokensWidget extends StatelessWidget {
  const PurchaseTokensWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyAppBar(),
            const RemainingTokensWidget(),
            const Divider(),
            Text(
              "Purchase Membership Connections",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 25,
                  ),
            ),
            const Row(
              children: [
                MembershipCard(
                  cardColour: Colors.yellow,
                  membershipName: "Gold",
                  membershipPrice: "1000",
                  membershipInfo: "You Will Get 60 Connections",
                ),
                MembershipCard(
                  cardColour: Colors.blueAccent,
                  membershipName: "Silver",
                  membershipPrice: "500",
                  membershipInfo: "You Will Get 25 Connections",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class PurchaseTokensWidgetDesktop extends StatelessWidget {
  const PurchaseTokensWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyAppBar(),
          const RemainingTokensWidget(),
          const Divider(),
          Text(
            "Purchase Membership Connections",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          const Row(
            children: [
              MembershipCard(
                cardColour: Colors.yellow,
                membershipName: "Gold",
                membershipPrice: "1000",
                membershipInfo: "You Will Get 60 Connections",
              ),
              MembershipCard(
                cardColour: Colors.blueAccent,
                membershipName: "Silver",
                membershipPrice: "500",
                membershipInfo: "You Will Get 25 Connections",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
