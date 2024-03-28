import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/favorite_property/favorite_property_cubit.dart';
import 'package:gharmart/utils/constants.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: const Icon(Icons.home),
      title: const Text("GharMarket"),
      actions: [
        BlocBuilder<FavoritePropertyCubit, FavoritePropertyState>(
          builder: (context, state) {
            return const SizedBox.shrink();
          },
        ),
        TextButton.icon(
          label: const Text("Menu"),
          onPressed: () {
            if (toAuthWrap(context)) {
              Scaffold.of(context).openEndDrawer();
            }
          },
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
