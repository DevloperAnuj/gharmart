import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/my_app_bar.dart';
import 'package:gharmart/features/subscription/presentation/manager/connections_management/connection_management_cubit.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

import '../../../../utils/config_file.dart';
import '../../../panel/presentation/widgets/profile_screen_widgets/membership_card_widget.dart';
import '../../../panel/presentation/widgets/profile_screen_widgets/purchase_token_widget.dart';
import '../../../panel/presentation/widgets/profile_screen_widgets/remaining_token_widget.dart';
import '../manager/fetch_profile/fetch_profile_cubit.dart';

class PurchaseConnectionPage extends StatelessWidget {
  const PurchaseConnectionPage({super.key});

  static const String routeName = "/purchaseconn";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<FetchProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceConfig.get<ConnectionManagementCubit>(),
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/lbg.png'),
            repeat: ImageRepeat.repeatY,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(),
          body: const MyBuilder(
            mobileView: PurchaseConnectionPageMobile(),
            tabletView: PurchaseConnectionPageTablet(),
            deskView: PurchaseConnectionPageDesktop(),
          ),
        ),
      ),
    );
  }
}

class PurchaseConnectionPageMobile extends StatelessWidget {
  const PurchaseConnectionPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
    );
  }
}

class PurchaseConnectionPageTablet extends StatelessWidget {
  const PurchaseConnectionPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
    );
  }
}

class PurchaseConnectionPageDesktop extends StatelessWidget {
  const PurchaseConnectionPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
    );
  }
}
