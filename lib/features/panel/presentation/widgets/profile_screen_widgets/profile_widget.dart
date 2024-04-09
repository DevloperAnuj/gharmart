import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:gharmart/features/auth/presentation/pages/auth_wrapper_page.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import 'package:gharmart/features/profile/presentation/pages/connections_property_page.dart';
import 'package:gharmart/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:gharmart/features/profile/presentation/pages/purchase_connections_page.dart';
import 'package:gharmart/features/subscription/presentation/manager/connections_management/connection_management_cubit.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:go_router/go_router.dart';

import '../../../../home_listings/presentation/pages/favorite_properties_page.dart';

class ProfileWidgetDesktop extends StatelessWidget {
  const ProfileWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: BlocBuilder<FetchProfileCubit, FetchProfileState>(
          builder: (context, state) {
            if (state is FetchProfileLoading) {
              return const CircularProgressIndicator();
            }
            if (state is FetchProfileSuccess) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Edit Profile",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text(state.profileEntity.name),
                      titleTextStyle:
                      Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      subtitle: const Text("Membership Level"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                    ListTile(
                      title: const Text("Phone No"),
                      subtitle: Text("91 - ${state.profileEntity.phone}"),
                      subtitleTextStyle:
                      Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                    ListTile(
                      title: const Text("Email"),
                      subtitle: Text(state.profileEntity.email),
                      subtitleTextStyle:
                      Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Get Update On WhatsApp",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    CupertinoSwitch(
                      value: true,
                      onChanged: (value) {},
                    ),
                    // Text(
                    //   state.profileEntity.name,
                    //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    //         color: Theme.of(context).primaryColor,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 40,
                    //       ),
                    // ),
                    // const SizedBox(height: 15),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton.icon(
                    //     onPressed: () {
                    //       context.pushNamed(ConnectionsPropertiesPage.routeName);
                    //     },
                    //     label: const Text("My Connections"),
                    //     icon: const Icon(Icons.handshake),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Theme.of(context).primaryColor,
                    //       foregroundColor: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 15),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton.icon(
                    //     onPressed: () {
                    //       context.pushNamed(PurchaseConnectionPage.routeName);
                    //     },
                    //     label: const Text("Purchase Plans"),
                    //     icon: const Icon(Icons.monetization_on_rounded),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Theme.of(context).primaryColor,
                    //       foregroundColor: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 15),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton.icon(
                    //     onPressed: () {
                    //       context.pushNamed(FavoritePropertiesPage.routeName);
                    //     },
                    //     label: const Text("Shortlisted"),
                    //     icon: const Icon(Icons.bookmark_add),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Theme.of(context).primaryColor,
                    //       foregroundColor: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 15),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton.icon(
                    //     onPressed: () {
                    //       context.pushNamed(EditProfilePage.routeName);
                    //     },
                    //     label: const Text("Edit Profile"),
                    //     icon: const Icon(Icons.edit),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Theme.of(context).primaryColor,
                    //       foregroundColor: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    // // const SizedBox(height: 15),
                    // // SizedBox(
                    // //   width: double.infinity,
                    // //   child: ElevatedButton.icon(
                    // //     onPressed: () {},
                    // //     label: const Text("Change Password"),
                    // //     icon: const Icon(Icons.password),
                    // //     style: ElevatedButton.styleFrom(
                    // //       backgroundColor: Theme.of(context).primaryColor,
                    // //       foregroundColor: Colors.white,
                    // //     ),
                    // //   ),
                    // // ),
                    // const SizedBox(height: 15),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton.icon(
                    //     onPressed: () {
                    //       context.read<SignInCubit>().logOut();
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: (context) => const AuthWrapperPage(),
                    //         ),
                    //       );
                    //     },
                    //     label: const Text("Sign Out"),
                    //     icon: const Icon(Icons.logout_outlined),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.red,
                    //       foregroundColor: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            }
            if (state is FetchProfileFailed) {
              return const Icon(
                Icons.error_rounded,
                size: 50,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class ProfileWidgetMobile extends StatelessWidget {
  const ProfileWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<FetchProfileCubit, FetchProfileState>(
        builder: (context, state) {
          if (state is FetchProfileLoading) {
            return const CircularProgressIndicator();
          }
          if (state is FetchProfileSuccess) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Edit Profile",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(),
                    title: Text(state.profileEntity.name),
                    titleTextStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                    subtitle: const Text("Membership Level"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                  ListTile(
                    title: const Text("Phone No"),
                    subtitle: Text("91 - ${state.profileEntity.phone}"),
                    subtitleTextStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                  ListTile(
                    title: const Text("Email"),
                    subtitle: Text(state.profileEntity.email),
                    subtitleTextStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Get Update On WhatsApp",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                  CupertinoSwitch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  // Text(
                  //   state.profileEntity.name,
                  //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  //         color: Theme.of(context).primaryColor,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 40,
                  //       ),
                  // ),
                  // const SizedBox(height: 15),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {
                  //       context.pushNamed(ConnectionsPropertiesPage.routeName);
                  //     },
                  //     label: const Text("My Connections"),
                  //     icon: const Icon(Icons.handshake),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Theme.of(context).primaryColor,
                  //       foregroundColor: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 15),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {
                  //       context.pushNamed(PurchaseConnectionPage.routeName);
                  //     },
                  //     label: const Text("Purchase Plans"),
                  //     icon: const Icon(Icons.monetization_on_rounded),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Theme.of(context).primaryColor,
                  //       foregroundColor: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 15),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {
                  //       context.pushNamed(FavoritePropertiesPage.routeName);
                  //     },
                  //     label: const Text("Shortlisted"),
                  //     icon: const Icon(Icons.bookmark_add),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Theme.of(context).primaryColor,
                  //       foregroundColor: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 15),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {
                  //       context.pushNamed(EditProfilePage.routeName);
                  //     },
                  //     label: const Text("Edit Profile"),
                  //     icon: const Icon(Icons.edit),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Theme.of(context).primaryColor,
                  //       foregroundColor: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // // const SizedBox(height: 15),
                  // // SizedBox(
                  // //   width: double.infinity,
                  // //   child: ElevatedButton.icon(
                  // //     onPressed: () {},
                  // //     label: const Text("Change Password"),
                  // //     icon: const Icon(Icons.password),
                  // //     style: ElevatedButton.styleFrom(
                  // //       backgroundColor: Theme.of(context).primaryColor,
                  // //       foregroundColor: Colors.white,
                  // //     ),
                  // //   ),
                  // // ),
                  // const SizedBox(height: 15),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {
                  //       context.read<SignInCubit>().logOut();
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (context) => const AuthWrapperPage(),
                  //         ),
                  //       );
                  //     },
                  //     label: const Text("Sign Out"),
                  //     icon: const Icon(Icons.logout_outlined),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.red,
                  //       foregroundColor: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          }
          if (state is FetchProfileFailed) {
            return const Icon(
              Icons.error_rounded,
              size: 50,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
