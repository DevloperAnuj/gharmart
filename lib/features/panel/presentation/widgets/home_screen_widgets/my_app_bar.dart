import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: const Icon(Icons.home),
      title: const Text("GharMart"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_border),
        ),
        TextButton.icon(
          label: const Text("Menu"),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}