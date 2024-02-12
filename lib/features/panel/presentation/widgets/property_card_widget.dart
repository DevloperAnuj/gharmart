import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

class PropertyCardWidget extends StatelessWidget {
  const PropertyCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MyBuilder(
      mobileView: PropertyCardWidgetMobile(),
      tabletView: PropertyCardWidgetTablet(),
      deskView: PropertyCardWidgetDesktop(),
    );
  }
}

class PropertyCardWidgetMobile extends StatelessWidget {
  const PropertyCardWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.w),
      child: Card(
        child: SizedBox(
          height: 500.w,
          width: 350.w,
        ),
      ),
    );
  }
}

class PropertyCardWidgetTablet extends StatelessWidget {
  const PropertyCardWidgetTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.w),
      child: Card(
        child: SizedBox(
          height: 400.w,
          width: 700.w,
        ),
      ),
    );
  }
}

class PropertyCardWidgetDesktop extends StatelessWidget {
  const PropertyCardWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.w),
      child: Card(
        child: SizedBox(
          height: 500.w,
          width: 900.w,
        ),
      ),
    );
  }
}
