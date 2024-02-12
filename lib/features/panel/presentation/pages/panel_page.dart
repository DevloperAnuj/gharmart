import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/panel/presentation/manager/panel_logic/panel_logic_cubit.dart';
import 'package:gharmart/features/panel/presentation/widgets/panel_section.dart';

import '../../../../utils/my_layout_builder.dart';
import '../widgets/sidebar.dart';

class PanelPage extends StatelessWidget {

  const PanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PanelLogicCubit(),
      child: const Scaffold(
        drawer: SideBar(),
        body: MyBuilder(
          mobileView: MobilePanelPage(),
          tabletView: TabletPanelPage(),
          deskView: DesktopPanelPage(),
        ),
      ),
    );
  }
}

class MobilePanelPage extends StatelessWidget {
  const MobilePanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text("GharMart"),
          centerTitle: true,
        ),
        const PanelSection(),
      ],
    );
  }
}

class TabletPanelPage extends StatelessWidget {
  const TabletPanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text("GharMart"),
          centerTitle: true,
        ),
        const PanelSection(),
      ],
    );
  }
}

class DesktopPanelPage extends StatelessWidget {
  const DesktopPanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SideBar(),
        PanelSection(),
      ],
    );
  }
}
