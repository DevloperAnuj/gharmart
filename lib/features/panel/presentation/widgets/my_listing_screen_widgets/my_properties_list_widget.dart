import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/get_user_properties/get_user_properties_cubit.dart';
import 'package:gharmart/features/panel/presentation/widgets/my_listing_screen_widgets/my_property_card_widget.dart';

class MyPropertiesListWidgetDesktop extends StatelessWidget {
  const MyPropertiesListWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocBuilder<GetUserPropertiesCubit, GetUserPropertiesState>(
          builder: (context, state) {
            return SizedBox(
              child: ListView.builder(
                itemCount: state.properties.length,
                itemBuilder: (c, i) {
                  return MyPropertyCardWidgetDesktop(
                    property: state.properties[i],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}



class MyPropertiesListWidgetMobile extends StatelessWidget {
  const MyPropertiesListWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: BlocBuilder<GetUserPropertiesCubit, GetUserPropertiesState>(
        builder: (context, state) {
          return SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.properties.length,
              itemBuilder: (c, i) {
                return MyPropertyCardWidgetMobile(
                  property: state.properties[i],
                );
              },
            ),
          );
        },
      ),
    );
  }
}


class MyPropertiesListWidgetTablet extends StatelessWidget {
  const MyPropertiesListWidgetTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: BlocBuilder<GetUserPropertiesCubit, GetUserPropertiesState>(
        builder: (context, state) {
          return SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.properties.length,
              itemBuilder: (c, i) {
                return MyPropertyCardWidgetTablet(
                  property: state.properties[i],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
