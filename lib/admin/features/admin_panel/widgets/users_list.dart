import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../features/profile/domain/entities/profile_entity.dart';
import '../manager/fetch_users/admin_fetch_users_cubit.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<AdminFetchUsersCubit, AdminFetchUsersState>(
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (c, i) {
              final ProfileEntity user = state.allUsers[i];
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(width: 1,color: Colors.black54),
                ),
                leading: CircleAvatar(
                  child: Text("${i + 1}"),
                ),
                title: Text(
                  user.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: SelectableText("\n📞: ${user.phone}"
                    "\n📧: ${user.email}"
                    "\n📍: ${user.city}"
                    "\n🌟: ${user.tokens}"
                    "\n📅: ${DateFormat.yMMMd().format(user.createdAt)}"),
              );
            },
            itemCount: state.allUsers.length,
            separatorBuilder: (c, i) {
              return const SizedBox(height: 10);
            },
          );
        },
      ),
    );
  }
}