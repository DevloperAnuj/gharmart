import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/admin/features/admin_panel/manager/fetch_reports/admin_fetch_reports_cubit.dart';
import 'package:gharmart/admin/features/admin_panel/widgets/properties_list_content.dart';
import 'package:gharmart/admin/features/admin_panel/widgets/reports_list.dart';
import 'package:gharmart/admin/features/admin_panel/widgets/users_list.dart';

import '../manager/admin_panel_logic/admin_panel_logic_cubit.dart';

class AdminContent extends StatelessWidget {
  const AdminContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: BlocBuilder<AdminPanelLogicCubit, int>(
        builder: (context, state) {
          if (state == 1) {
            return const ApprovedPropertiesList();
          }
          if (state == 2) {
            return const DelistedPropertiesList();
          }
          if (state == 3) {
            return const WithheldPropertiesList();
          }
          if (state == 4) {
            return const UsersList();
          }
          if (state == 5) {
            return const ReportsList();
          }
          return const PendingPropertiesList();
        },
      ),
    );
  }
}
