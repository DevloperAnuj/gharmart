import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import 'package:gharmart/features/profile/presentation/pages/edit_profile_page.dart';
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
              return Column(
                children: [
                  const Icon(
                    Icons.person,
                    size: 75,
                  ),
                  const Divider(),
                  Text(
                    state.profileEntity.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    state.profileEntity.email,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    state.profileEntity.phone,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    state.profileEntity.city,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.pushNamed(EditProfilePage.routeName);
                      },
                      label: const Text("Edit Profile"),
                      icon: const Icon(Icons.edit),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text("Change Password"),
                      icon: const Icon(Icons.password),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text("My Connections"),
                      icon: const Icon(Icons.handshake),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  // const SizedBox(height: 15),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {},
                  //     label: const Text("My plans"),
                  //     icon: const Icon(Icons.monetization_on_rounded),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Theme.of(context).primaryColor,
                  //       foregroundColor: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.pushNamed(FavoritePropertiesPage.routeName);
                      },
                      label: const Text("Shortlisted"),
                      icon: const Icon(Icons.bookmark),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<SignInCubit>().logOut();
                      },
                      label: const Text("Sign Out"),
                      icon: const Icon(Icons.logout_outlined),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
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
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<FetchProfileCubit, FetchProfileState>(
        builder: (context, state) {
          if (state is FetchProfileLoading) {
            return const CircularProgressIndicator();
          }
          if (state is FetchProfileSuccess) {
            return Column(
              children: [
                const Icon(
                  Icons.person,
                  size: 75,
                ),
                const Divider(),
                Text(
                  state.profileEntity.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 15),
                Text(
                  state.profileEntity.email,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 15),
                Text(
                  state.profileEntity.phone,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 15),
                Text(
                  state.profileEntity.city,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.pushNamed(EditProfilePage.routeName);
                    },
                    label: const Text("Edit Profile"),
                    icon: const Icon(Icons.edit),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("Change Password"),
                    icon: const Icon(Icons.password),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.pushNamed(FavoritePropertiesPage.routeName);
                    },
                    label: const Text("Shortlisted"),
                    icon: const Icon(Icons.bookmark_add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("My Connections"),
                    icon: const Icon(Icons.handshake),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                // const SizedBox(height: 15),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton.icon(
                //     onPressed: () {},
                //     label: const Text("My plans"),
                //     icon: const Icon(Icons.monetization_on_rounded),
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Theme.of(context).primaryColor,
                //       foregroundColor: Colors.white,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<SignInCubit>().logOut();
                    },
                    label: const Text("Sign Out"),
                    icon: const Icon(Icons.logout_outlined),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
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
