import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/display_properties/display_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';

class PropertiesListWidgetMobile extends StatelessWidget {
  const PropertiesListWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (c, i) {
            return const PropertyCardWidgetMobile();
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (c, i) {
            return const PropertyCardWidgetTablet();
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
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocConsumer<FetchPropertiesCubit, FetchPropertiesState>(
          listener: (context, state) {
            if (state.properties.isNotEmpty) {
              context.read<DisplayPropertiesCubit>().displayProperties();
            }
          },
          builder: (context, state) {
            if (state.properties.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return SizedBox(
              child:
                  BlocBuilder<DisplayPropertiesCubit, DisplayPropertiesState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.properties.length,
                    itemBuilder: (c, i) {
                      final property = state.properties[i];
                      return PropertyCardWidgetDesktop(
                        property: property,
                      );
                    },
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
