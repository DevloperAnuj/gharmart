import 'package:flutter/material.dart';

class MyListingInfoTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData iconData;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(color: Colors.black),
        ),
        leading: Icon(iconData),
        tileColor: colour,
        style: ListTileStyle.drawer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  const MyListingInfoTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconData,
    required this.colour,
  });
}
