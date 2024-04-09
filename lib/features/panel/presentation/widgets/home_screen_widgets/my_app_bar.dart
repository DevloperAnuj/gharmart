import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/favorite_property/favorite_property_cubit.dart';
import 'package:gharmart/features/landing_page/presentation/pages/landing_page.dart';
import 'package:gharmart/features/panel/presentation/sreens/listings_screen.dart';
import 'package:gharmart/features/panel/presentation/sreens/profile_screen.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import '../../../../auth/presentation/pages/auth_wrapper_page.dart';
import '../../../../home_listings/presentation/pages/favorite_properties_page.dart';
import '../../../../profile/presentation/pages/connections_property_page.dart';
import '../../../../profile/presentation/pages/purchase_connections_page.dart';
import '../../manager/panel_logic/panel_logic_cubit.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: const Icon(Icons.home),
      title: const Text("GharMarket"),
      actions: [
        BlocBuilder<FavoritePropertyCubit, FavoritePropertyState>(
          builder: (context, state) {
            return const SizedBox.shrink();
          },
        ),
        IconButton(
          onPressed: () {
            if (toAuthWrap(context)) {
              context.pushNamed(FavoritePropertiesPage.routeName);
            }
          },
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const MyPopUpMenuButton(),
      ],
    );
  }
}

class MyPopUpMenuButton extends StatelessWidget {
  const MyPopUpMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<FetchProfileCubit>()..fetchProfile(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
      ],
      child: PopupMenuButton(
          icon: const Icon(Icons.menu),
          itemBuilder: (context) {
            if (toAuthWrap(context)) {
              return [
                PopupMenuItem(
                  child: const ListTile(
                    title: Text("Profile"),
                    leading: Icon(Icons.person),
                  ),
                  onTap: () {
                    context.pushNamed(ProfilePage.routeName);
                  },
                ),
                PopupMenuItem(
                  child: const ListTile(
                    title: Text("My Connections"),
                    leading: Icon(Icons.handshake),
                  ),
                  onTap: () {
                    context.pushNamed(ConnectionsPropertiesPage.routeName);
                  },
                ),
                PopupMenuItem(
                  child: const ListTile(
                    title: Text("My Plans"),
                    leading: Icon(Icons.attach_money_outlined),
                  ),
                  onTap: () {
                    context.pushNamed(PurchaseConnectionPage.routeName);
                  },
                ),
                PopupMenuItem(
                  child: const ListTile(
                    title: Text("My Listings"),
                    leading: Icon(Icons.list),
                  ),
                  onTap: () {
                    context.pushNamed(MyPropertiesListingPage.routeName);
                  },
                ),
                PopupMenuItem(
                  child: const ListTile(
                    title: Text("Favorites"),
                    leading: Icon(Icons.favorite),
                  ),
                  onTap: () {
                    context.pushNamed(FavoritePropertiesPage.routeName);
                  },
                ),
                PopupMenuItem(
                  child: const ListTile(
                    title: Text("Log Out"),
                    leading: Icon(Icons.logout_outlined),
                  ),
                  onTap: () {
                    context.read<SignInCubit>().logOut();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LandingPage(),
                      ),
                    );
                  },
                ),
              ];
            }
            return [];
          }),
    );
  }
}
