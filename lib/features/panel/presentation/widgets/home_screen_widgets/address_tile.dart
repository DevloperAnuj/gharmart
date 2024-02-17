import 'package:flutter/material.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MyBuilder(
      mobileView: AddressTileMobile(),
      tabletView: AddressTileTablet(),
      deskView: AddressTileDesktop(),
    );
  }
}

class AddressTileMobile extends StatelessWidget {
  const AddressTileMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.my_location),
      title: const Text("Building Name on Address Title"),
      subtitle: const Text("Building name with its location and full address"),
      titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 8,
            color: Colors.black,
          ),
      subtitleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 6,
            color: Colors.black,
          ),
    );
  }
}

class AddressTileTablet extends StatelessWidget {
  const AddressTileTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.my_location),
      title: const Text("Building Name on Address Title"),
      subtitle: const Text("Building name with its location and full address"),
      titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 16,
            color: Colors.black,
          ),
      subtitleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 14,
            color: Colors.black,
          ),
    );
  }
}

class AddressTileDesktop extends StatelessWidget {
  const AddressTileDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.my_location),
      title: const Text("Building Name on Address Title"),
      subtitle: const Text("Building name with its location and full address"),
      titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
      subtitleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 14,
            color: Colors.black,
          ),
    );
  }
}
