import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/panel/presentation/manager/panel_logic/panel_logic_cubit.dart';
import 'package:gharmart/features/panel/presentation/sreens/home_screen.dart';
import 'package:gharmart/features/panel/presentation/sreens/listings_screen.dart';
import 'package:gharmart/features/panel/presentation/sreens/profile_screen.dart';
import 'package:gharmart/features/panel/presentation/sreens/subscription_screen.dart';

class MobilePanelSection extends StatelessWidget {
  const MobilePanelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PanelLogicCubit, int>(
      builder: (context, state) {
        if (state == 1) {
          return const ListingScreen();
        } else if (state == 2) {
          return const SubscriptionScreen();
        } else if (state == 3) {
          return const ProfileScreen();
        } else {
          return const HomeScreenMobile();
        }
      },
    );
  }
}

class TabletPanelSection extends StatelessWidget {
  const TabletPanelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PanelLogicCubit, int>(
      builder: (context, state) {
        if (state == 1) {
          return const ListingScreen();
        } else if (state == 2) {
          return const SubscriptionScreen();
        } else if (state == 3) {
          return const ProfileScreen();
        } else {
          return const HomeScreenTablet();
        }
      },
    );
  }
}

class DesktopPanelSection extends StatelessWidget {
  const DesktopPanelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PanelLogicCubit, int>(
        builder: (context, state) {
          if (state == 1) {
            return const ListingScreen();
          } else if (state == 2) {
            return const SubscriptionScreen();
          } else if (state == 3) {
            return const ProfileScreen();
          } else {
            return const HomeScreenDesktop();
          }
        },
      ),
    );
  }
}
