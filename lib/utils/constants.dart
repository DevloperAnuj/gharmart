import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:gharmart/features/auth/presentation/pages/auth_page.dart';
import 'package:gharmart/features/auth/presentation/pages/auth_wrapper_page.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_connections/fetch_connections_cubit.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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

void showOwnerTile(BuildContext context, PropertyEntity property) {
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: serviceConfig.get<ConnectionManagementCubit>(),
          ),
          BlocProvider.value(
            value: serviceConfig.get<FetchConnectionsCubit>(),
          ),
          BlocProvider.value(
            value: serviceConfig.get<FetchProfileCubit>(),
          ),
        ],
        child: Builder(
          builder: (context) {
            return BlocBuilder<FetchProfileCubit, FetchProfileState>(
              builder: (context, state) {
                if (state is FetchProfileSuccess) {
                  return PopScope(
                    onPopInvoked: (_) {
                      if (_) {
                        context
                            .read<ConnectionManagementCubit>()
                            .handleConnection(state.profileEntity.id);
                      }
                    },
                    child: AlertDialog(
                      title: const Text("Owner Details"),
                      icon: const Icon(Icons.person, size: 50),
                      content:
                          context.watch<ConnectionManagementCubit>().state > 0
                              ? ExpansionTile(
                                  onExpansionChanged: (_) {
                                    context
                                        .read<FetchConnectionsCubit>()
                                        .addToConnection(property);
                                  },
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
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "🤝🏻 User Connections Are Expired Please Purchase it to Continue",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Colors.red,
                                        ),
                                  ),
                                ),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: context
                                  .watch<ConnectionManagementCubit>()
                                  .state >
                              0
                          ? [
                              FlutterSocialButton(
                                mini: true,
                                title: "Call Now",
                                buttonType: ButtonType.phone,
                                onTap: () async {
                                  final url =
                                      Uri.parse("tel://${property.user.phone}");
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
                                  final url = Uri.parse(
                                      "https://wa.me/91${property.user.phone}");
                                  if (!await launchUrl(url)) {
                                    throw Exception('Could not launch $url');
                                  }
                                },
                              ),
                            ]
                          : null,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            );
          },
        ),
      );
    },
  );
}

bool toAuthWrap(BuildContext context) {
  final supabase = serviceConfig.get<SupabaseClient>();
  if (supabase.auth.currentUser == null) {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return const AuthPage();
      },
    );
    return false;
  } else {
    return true;
  }
}
