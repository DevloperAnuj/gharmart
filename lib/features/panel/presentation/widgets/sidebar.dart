import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/panel/presentation/manager/panel_logic/panel_logic_cubit.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SidebarX(
        theme: SidebarXTheme(
          width: 250,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(29, 28, 29, 1.000),
            borderRadius: BorderRadius.circular(30),
          ),
          selectedTextStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
          selectedItemDecoration: BoxDecoration(
            color: const Color.fromARGB(100, 50, 50, 50),
            borderRadius: BorderRadius.circular(20),
          ),
          hoverTextStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
          itemMargin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        ),
        showToggleButton: false,
        controller: SidebarXController(
          selectedIndex: context.watch<PanelLogicCubit>().state,
          extended: true,
        ),
        headerBuilder: (context, ct) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
          );
        },
        items: [
          SidebarXItem(
            iconWidget: const SidebarIcon(iconData: Icons.home),
            label: 'Home',
            onTap: () {
              context.read<PanelLogicCubit>().toggleScreen(0);
            },
          ),
          SidebarXItem(
            iconWidget: const SidebarIcon(iconData: Icons.list),
            label: 'Listings',
            onTap: () {
              context.read<PanelLogicCubit>().toggleScreen(1);
            },
          ),
          SidebarXItem(
            iconWidget: const SidebarIcon(iconData: Icons.military_tech),
            label: 'Subscription',
            onTap: () {
              context.read<PanelLogicCubit>().toggleScreen(2);
            },
          ),
          SidebarXItem(
            iconWidget: const SidebarIcon(iconData: Icons.person),
            label: 'Profile',
            onTap: () {
              context.read<PanelLogicCubit>().toggleScreen(3);
            },
          ),
        ],
      ),
    );
  }
}

class SidebarIcon extends StatelessWidget {
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Icon(iconData, color: Colors.white),
    );
  }

  const SidebarIcon({
    super.key,
    required this.iconData,
  });
}

class SideBarDrawer extends StatelessWidget {
  const SideBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
