import 'package:flutter/material.dart';

import '../widgets/subscription_screen_widgets/purchase_token_widget.dart';
import '../widgets/subscription_screen_widgets/remaining_token_widget.dart';

class SubscriptionScreenMobile extends StatelessWidget {
  const SubscriptionScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SubscriptionScreenTablet extends StatelessWidget {
  const SubscriptionScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SubscriptionScreenDesktop extends StatelessWidget {
  const SubscriptionScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        RemainingTokensWidget(),
        VerticalDivider(),
        PurchaseTokensWidget(),
      ],
    );
  }
}
