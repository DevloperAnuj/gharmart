part of 'admin_fetch_users_cubit.dart';

class AdminFetchUsersState {

  final List<ProfileEntity> allUsers;

  const AdminFetchUsersState({
    required this.allUsers,
  });

  factory AdminFetchUsersState.initial(){
    return const AdminFetchUsersState(allUsers: []);
  }

  AdminFetchUsersState copyWith({
    List<ProfileEntity>? allUsers,
  }) {
    return AdminFetchUsersState(
      allUsers: allUsers ?? this.allUsers,
    );
  }
}
