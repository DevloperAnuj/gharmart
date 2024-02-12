import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharmart/features/panel/presentation/widgets/property_card_widget.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

class PropertiesListWidget extends StatelessWidget {
  const PropertiesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyBuilder(
      mobileView: PropertiesListWidgetMobile(),
      tabletView: PropertiesListWidgetTablet(),
      deskView: PropertiesListWidgetDesktop(),
    );
  }
}

class PropertiesListWidgetMobile extends StatelessWidget {
  const PropertiesListWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 530.h,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (c, i) {
            return const PropertyCardWidget();
          },
        ),
      ),
    );
  }
}

class PropertiesListWidgetTablet extends StatelessWidget {
  const PropertiesListWidgetTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 848.h,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (c, i) {
            return const PropertyCardWidget();
          },
        ),
      ),
    );
  }
}

class PropertiesListWidgetDesktop extends StatelessWidget {
  const PropertiesListWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        width: 980.w,
        height: 680.h,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (c, i) {
            return const PropertyCardWidget();
          },
        ),
      ),
    );
  }
}
