import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/display_properties/display_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/filter/listing_filter_cubit.dart';
import 'package:gharmart/features/panel/presentation/manager/panel_logic/panel_logic_cubit.dart';
import 'package:gharmart/features/panel/presentation/widgets/panel_section.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

import '../widgets/home_screen_widgets/my_app_bar.dart';
import '../widgets/sidebar.dart';

class PanelPage extends StatelessWidget {
  const PanelPage({super.key});

  static const String routeName = "/mypanel";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<FetchPropertiesCubit>()..fetchProperties(),
        ),
        BlocProvider(
          create: (context) => PanelLogicCubit(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<SignUpCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<SignInCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<FetchProfileCubit>()..fetchProfile(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<ListingFilterCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<DisplayPropertiesCubit>(),
        ),
      ],
      child: BlocBuilder<FetchProfileCubit, FetchProfileState>(
        builder: (context, state) {
          return const MyBuilder(
            mobileView: MobilePanelPage(),
            tabletView: TabletPanelPage(),
            deskView: DesktopPanelPage(),
          );
        },
      ),
    );
  }
}

class MobilePanelPage extends StatelessWidget {
  const MobilePanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      endDrawer: SideBar(),
      body: Column(
        children: [
          MyAppBar(),
          MobilePanelSection(),
        ],
      ),
    );
  }
}

class TabletPanelPage extends StatelessWidget {
  const TabletPanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      endDrawer: SideBar(),
      body: Column(
        children: [
          MyAppBar(),
          TabletPanelSection(),
        ],
      ),
    );
  }
}

class DesktopPanelPage extends StatelessWidget {
  const DesktopPanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideBar(),
      body: Builder(
        builder: (context) {
          return const Column(
            children: [
              MyAppBar(),
              DesktopPanelSection(),
            ],
          );
        },
      ),
    );
  }
}
