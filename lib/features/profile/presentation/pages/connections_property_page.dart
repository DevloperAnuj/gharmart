import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/home_listings/presentation/manager/favorite_property/favorite_property_cubit.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_connections/fetch_connections_cubit.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

import '../../../home_listings/domain/entities/favorite_property_entity.dart';
import '../widgets/connection_property_card.dart';

class ConnectionsPropertiesPage extends StatelessWidget {
  const ConnectionsPropertiesPage({super.key});

  static const String routeName = "/myConn";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<FetchConnectionsCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<FavoritePropertyCubit>(),
        ),
      ],
      child: const MyBuilder(
        mobileView: ConnectionPropertiesPageMobile(),
        tabletView: ConnectionPropertiesPageTablet(),
        deskView: ConnectionPropertiesPageDesktop(),
      ),
    );
  }
}

class ConnectionPropertiesPageMobile extends StatelessWidget {
  const ConnectionPropertiesPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: FittedBox(
              child: Text(
                "Your Connected Properties",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          const ConnectionPropertiesListWidgetMobile(),
        ],
      ),
    );
  }
}

class ConnectionPropertiesPageTablet extends StatelessWidget {
  const ConnectionPropertiesPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: FittedBox(
              child: Text(
                "Your Connected Properties",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          const ConnectionPropertiesListWidgetTablet(),
        ],
      ),
    );
  }
}

class ConnectionPropertiesPageDesktop extends StatelessWidget {
  const ConnectionPropertiesPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text(
              "Your Connected Properties",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                ConnectionPropertiesListWidgetDesktop(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConnectionPropertiesListWidgetDesktop extends StatelessWidget {
  const ConnectionPropertiesListWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: BlocBuilder<FetchConnectionsCubit, FetchConnectionsState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.connectionList.length,
                itemBuilder: (c, i) {
                  final property = state.connectionList[i];
                  return ConnectionPropertyCardWidgetDesktop(
                    property: property,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class ConnectionPropertiesListWidgetMobile extends StatelessWidget {
  const ConnectionPropertiesListWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: BlocBuilder<FetchConnectionsCubit, FetchConnectionsState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.connectionList.length,
                itemBuilder: (c, i) {
                  final property = state.connectionList[i];
                  return ConnectionPropertyCardWidgetMobile(
                    property: property,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class ConnectionPropertiesListWidgetTablet extends StatelessWidget {
  const ConnectionPropertiesListWidgetTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: BlocBuilder<FetchConnectionsCubit, FetchConnectionsState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.connectionList.length,
                itemBuilder: (c, i) {
                  final property = state.connectionList[i];
                  return ConnectionPropertyCardWidgetTablet(
                    property: property,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

void showConnectedOwnerTile(BuildContext context, PropertyEntity property) {
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
                    property.user.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                  subtitle: const Text("Name"),
                ),
                ListTile(
                  title: SelectableText(
                    property.user.phone,
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
