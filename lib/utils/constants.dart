import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

import '../features/home_listings/domain/entities/property_entity.dart';
import '../features/subscription/presentation/manager/connections_management/connection_management_cubit.dart';
import 'config_file.dart';

class MyConstants {
  static const String supabaseAnonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImViZ2NsbnZ0eHlzcHFyb3dpbmlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg3NjMwMjcsImV4cCI6MjAyNDMzOTAyN30.lfewDkcGzSLhrAjrkA2qiubVNmk3GMCXgr1EKjhtWk4";
  static const String supabaseUrl = "https://ebgclnvtxyspqrowinip.supabase.co";

  static void mySnackBar(
    BuildContext context, {
    required String message,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}

void showOwnerTile(BuildContext context, User user) {
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return BlocProvider.value(
        value: serviceConfig.get<ConnectionManagementCubit>(),
        child: Builder(
          builder: (context) {
            return PopScope(
              onPopInvoked: (_) {
                if (_) {
                  context.read<ConnectionManagementCubit>().handleConnection();
                }
              },
              child: AlertDialog(
                title: const Text("Owner Details"),
                icon: const Icon(Icons.person, size: 50),
                content: context.watch<ConnectionManagementCubit>().state > 0
                    ? ExpansionTile(
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
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "🤝🏻 User Connections Are Expired Please Purchase it to Continue",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                      ),
                actionsAlignment: MainAxisAlignment.center,
                actions: context.watch<ConnectionManagementCubit>().state > 0
                    ? [
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
                      ]
                    : null,
              ),
            );
          },
        ),
      );
    },
  );
}
