import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharmart/features/panel/presentation/manager/panel_logic/panel_logic_cubit.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: SidebarX(
        theme: SidebarXTheme(
          width: 250.w,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(29,28,29,1.000),
            borderRadius: BorderRadius.circular(30.r),
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
            borderRadius: BorderRadius.circular(20.r),
          ),
          hoverTextStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
          itemMargin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
        ),
        showToggleButton: false,
        controller: SidebarXController(
          selectedIndex: context.watch<PanelLogicCubit>().state,
          extended: true,
        ),
        headerBuilder: (context, ct) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: CircleAvatar(
              radius: 50.r,
              backgroundImage: const AssetImage('assets/images/logo.png'),
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
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Icon(iconData, color: Colors.white),
    );
  }

  const SidebarIcon({
    super.key,
    required this.iconData,
  });
}
