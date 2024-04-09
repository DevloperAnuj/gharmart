import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/home_listings/presentation/manager/favorite_property/favorite_property_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/pages/property_details_Page.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/config_file.dart';
import '../../../../../utils/constants.dart';
import '../../../home_listings/presentation/manager/report_property/report_property_cubit.dart';

class ConnectionPropertyCardWidgetMobile extends StatelessWidget {
  final PropertyEntity property;

  const ConnectionPropertyCardWidgetMobile({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              context.pushNamed(PropertyDetailsPage.routeName, extra: property);
            },
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(property.user.name[0],
                  style: const TextStyle(color: Colors.white)),
            ),
            title: Text(
              property.user.name,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            subtitle: Text(
              property.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
            ),
            trailing: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterSocialButton(
                    mini: true,
                    title: "Call Now",
                    buttonType: ButtonType.phone,
                    onTap: () async {
                      final url = Uri.parse("tel://${property.user.phone}");
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                  ),
                  FlutterSocialButton(
                    mini: true,
                    title: "WhatsApp",
                    buttonType: ButtonType.whatsapp,
                    iconColor: Colors.white,
                    onTap: () async {
                      final url =
                          Uri.parse("https://wa.me/91${property.user.phone}");
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConnectionPropertyCardWidgetTablet extends StatelessWidget {
  final PropertyEntity property;

  const ConnectionPropertyCardWidgetTablet({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              context.pushNamed(PropertyDetailsPage.routeName, extra: property);
            },
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(property.user.name[0],
                  style: const TextStyle(color: Colors.white)),
            ),
            title: Text(
              property.user.name,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            subtitle: Text(
              property.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
            ),
            trailing: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterSocialButton(
                    mini: true,
                    title: "Call Now",
                    buttonType: ButtonType.phone,
                    onTap: () async {
                      final url = Uri.parse("tel://${property.user.phone}");
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                  ),
                  FlutterSocialButton(
                    mini: true,
                    title: "WhatsApp",
                    buttonType: ButtonType.whatsapp,
                    iconColor: Colors.white,
                    onTap: () async {
                      final url =
                          Uri.parse("https://wa.me/91${property.user.phone}");
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////

class ConnectionPropertyCardWidgetDesktop extends StatelessWidget {
  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              context.pushNamed(PropertyDetailsPage.routeName, extra: property);
            },
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(property.user.name[0],
                  style: const TextStyle(color: Colors.white)),
            ),
            title: Text(
              property.user.name,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            subtitle: Text(
              property.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
            ),
            trailing: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterSocialButton(
                    mini: true,
                    title: "Call Now",
                    buttonType: ButtonType.phone,
                    onTap: () async {
                      final url = Uri.parse("tel://${property.user.phone}");
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                  ),
                  FlutterSocialButton(
                    mini: true,
                    title: "WhatsApp",
                    buttonType: ButtonType.whatsapp,
                    iconColor: Colors.white,
                    onTap: () async {
                      final url =
                          Uri.parse("https://wa.me/91${property.user.phone}");
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  const ConnectionPropertyCardWidgetDesktop({
    super.key,
    required this.property,
  });
}

class AddToFavoriteButton extends StatelessWidget {
  const AddToFavoriteButton({
    super.key,
    required this.property,
  });

  final PropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritePropertyCubit, FavoritePropertyState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<FavoritePropertyCubit>().toggleFavorite(property);
          },
          icon: Icon(
            state.favoritePropertyList
                    .any((element) => element.id == property.id)
                ? Icons.bookmark
                : Icons.bookmark_add_outlined,
            color: state.favoritePropertyList
                    .any((element) => element.id == property.id)
                ? Colors.red
                : Colors.black,
          ),
        );
      },
    );
  }
}

class InfoTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        minLeadingWidth: 5,
        leading: leading,
        title: title,
        subtitle: subtitle,
        titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
        subtitleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 14,
              color: Colors.black,
            ),
      ),
    );
  }

  const InfoTile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
  });
}

class InfoTileMobile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 5,
      leading: leading,
      title: title,
      subtitle: subtitle,
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

  const InfoTileMobile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
  });
}

void showReportTile(BuildContext context, String id) {
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return BlocProvider.value(
        value: serviceConfig.get<ReportPropertyCubit>(),
        child: Builder(builder: (context) {
          return AlertDialog.adaptive(
            icon: const Icon(Icons.flag),
            title: const Text("Report Property"),
            content: BlocListener<ReportPropertyCubit, ReportPropertyState>(
              listener: (context, state) {
                if (state is ReportPropertySuccess) {
                  Navigator.pop(context);
                  MyConstants.mySnackBar(
                    context,
                    message: "Report Submitted Successfully !",
                    color: Colors.indigo,
                  );
                }
              },
              child: ListTile(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(25),
                // ),
                minLeadingWidth: 20,
                title:
                    const Text("Report what was not correct in this property"),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          context
                              .read<ReportPropertyCubit>()
                              .submitReport(id, "Listed By Broker");
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.black),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("Listed By Broker"),
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<ReportPropertyCubit>()
                              .submitReport(id, "Rented Out");
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.black),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("Rented out"),
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<ReportPropertyCubit>()
                              .submitReport(id, "Wrong Info");
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.black),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("Wrong Info"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      );
    },
  );
}

void showConnectedOwnerTile(BuildContext context, User user) {
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return Builder(
        builder: (context) {
          return AlertDialog(
            title: const Text("Owner Details"),
            icon: const Icon(Icons.person, size: 50),
            content: ExpansionTile(
              maintainState: true,
              title: const Text("Details"),
              children: [
                ListTile(
                  title: SelectableText(
                    user.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                  subtitle: const Text("Name"),
                ),
                ListTile(
                  title: SelectableText(
                    user.phone,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                  subtitle: const Text("Phone"),
                ),
              ],
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              FlutterSocialButton(
                mini: true,
                title: "Call Now",
                buttonType: ButtonType.phone,
                onTap: () {},
              ),
              FlutterSocialButton(
                mini: true,
                title: "WhatsApp",
                buttonType: ButtonType.whatsapp,
                iconColor: Colors.white,
                onTap: () {},
              ),
            ],
          );
        },
      );
    },
  );
}
