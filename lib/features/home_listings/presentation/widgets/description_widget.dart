import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                    color: Colors.black,
                    child: Text(
                      "Amenities",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 10,
                      children: [
                        Chip(
                          label: const Text("Security"),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        Chip(
                          label: const Text("Lift"),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        Chip(
                          label: const Text("Power Backup"),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        Chip(
                          label: const Text("AC"),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        Chip(
                          label: const Text("Club"),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        Chip(
                          label: const Text("Gas"),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        Chip(
                          label: const Text("Playground"),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        Chip(
                          label: const Text("House Keeper"),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                    color: Colors.black,
                    child: Text(
                      "Description",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                   Text(
                    lorem(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
