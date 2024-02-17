import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/panel/presentation/manager/panel_logic/panel_logic_cubit.dart';
import 'package:gharmart/features/panel/presentation/widgets/panel_section.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

import '../widgets/home_screen_widgets/my_app_bar.dart';
import '../widgets/sidebar.dart';

class PanelPage extends StatelessWidget {
  const PanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PanelLogicCubit(),
      child: const MyBuilder(
        mobileView: MobilePanelPage(),
        tabletView: TabletPanelPage(),
        deskView: DesktopPanelPage(),
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
