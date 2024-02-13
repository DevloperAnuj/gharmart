import 'package:flutter/material.dart';
import 'package:gharmart/features/panel/presentation/widgets/property_list_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/panel_section.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const PropertiesListWidgetMobile();
  }
}

class HomeScreenTablet extends StatelessWidget {
  const HomeScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const PropertiesListWidgetTablet();
  }
}

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (_) {},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xfff1f1f1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search for Locations",
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Search"),
              ),
            ),
          ],
        ),
        const Divider(),
        const Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: PropertiesListWidgetDesktop(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
