import 'package:flutter/material.dart';

class MyBuilder extends StatelessWidget {

  final Widget mobileView;
  final Widget tabletView;
  final Widget deskView;

  const MyBuilder({
    super.key,
    required this.mobileView,
    required this.tabletView,
    required this.deskView,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 439) {
          //Iphone SE
          return mobileView;
        } else if (constraints.maxWidth < 850) {
          //Ipad Mini
          return tabletView;
        } else {
          //Nest Hub Max
          return deskView;
        }
      },
    );
  }
}
