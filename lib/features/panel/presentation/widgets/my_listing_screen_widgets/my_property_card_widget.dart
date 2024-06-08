import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/pages/edit_property_details.dart';
import 'package:gharmart/features/properties/presentation/manager/delist_property/delist_property_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/constants.dart';
import '../../../../home_listings/domain/entities/property_entity.dart';
import '../../../../home_listings/presentation/pages/property_details_Page.dart';
import '../home_screen_widgets/property_card_widget.dart';

class MyPropertyCardWidgetDesktop extends StatelessWidget {
  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(PropertyDetailsPage.routeName, extra: property);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage(property.picsUrl.first),
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        getTileStatusText(property.status),
                        style: TextStyle(
                          backgroundColor:
                              getTileStatusBGColour(property.status),
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          property.title,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          property.title,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                      const Divider(),
                      if (property.status == 3)
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<DelistPropertyCubit>()
                                .relistCurrentProperty(property.id);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Re-Activate"),
                        ),
                      if (property.status == 0)
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<DelistPropertyCubit>()
                                .delistCurrentProperty(property.id);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("De-Activate"),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  const MyPropertyCardWidgetDesktop({
    super.key,
    required this.property,
  });
}

class StatusWidget extends StatelessWidget {
  final int status;

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      return const CircleAvatar(
        child: Icon(Icons.approval),
      );
    }
    if (status == 1) {
      return CircleAvatar(
        child: Icon(
          Icons.pending,
          color: Colors.yellow.shade200,
        ),
      );
    }
    if (status == 2) {
      return const CircleAvatar(
        child: Icon(Icons.error_rounded),
      );
    }
    if (status == 3) {
      return const CircleAvatar(
        child: Icon(Icons.delete),
      );
    }
    return const SizedBox.shrink();
  }

  const StatusWidget({
    super.key,
    required this.status,
  });
}

Color getTileStatusColour(int status) {
  if (status == 0) {
    return Colors.green.shade100;
  }
  if (status == 1) {
    return Colors.yellow.shade100;
  }
  if (status == 2) {
    return Colors.orange.shade100;
  }
  if (status == 3) {
    return Colors.red.shade100;
  }
  return Colors.white;
}

Color getTileStatusBGColour(int status) {
  if (status == 0) {
    return Colors.green;
  }
  if (status == 1) {
    return Colors.amber;
  }
  if (status == 2) {
    return Colors.orange;
  }
  if (status == 3) {
    return Colors.red;
  }
  return Colors.white;
}

String getTileStatusText(int status) {
  if (status == 0) {
    return "Property is Active .";
  }
  if (status == 1) {
    return "Property is Pending .";
  }
  if (status == 2) {
    return "Property is Withheld .";
  }
  if (status == 3) {
    return "Property is Delisted .";
  }
  return "";
}

class MyPropertyCardWidgetMobile extends StatelessWidget {
  final PropertyEntity property;

  const MyPropertyCardWidgetMobile({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(PropertyDetailsPage.routeName, extra: property);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage(property.picsUrl.first),
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        getTileStatusText(property.status),
                        style: TextStyle(
                          backgroundColor:
                              getTileStatusBGColour(property.status),
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          property.title,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          property.title,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                      const Divider(),
                      if (property.status == 3)
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<DelistPropertyCubit>()
                                .relistCurrentProperty(property.id);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Re-Activate"),
                        ),
                      if (property.status == 0)
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<DelistPropertyCubit>()
                                .delistCurrentProperty(property.id);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("De-Activate"),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPropertyCardWidgetTablet extends StatelessWidget {
  final PropertyEntity property;

  const MyPropertyCardWidgetTablet({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(PropertyDetailsPage.routeName, extra: property);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage(property.picsUrl.first),
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        getTileStatusText(property.status),
                        style: TextStyle(
                          backgroundColor:
                              getTileStatusBGColour(property.status),
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          property.title,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          property.title,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                      const Divider(),
                      if (property.status == 3)
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Re-Activate"),
                        ),
                      if (property.status == 0)
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("De-Activate"),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
