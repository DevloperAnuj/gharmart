import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';

class DescriptionWidget extends StatelessWidget {

  final PropertyEntity property;

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
                      children: property.amenities.map((ame) => Chip(label: Text(ame))).toList(),
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
                    property.desc,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  const DescriptionWidget({super.key,
    required this.property,
  });
}
