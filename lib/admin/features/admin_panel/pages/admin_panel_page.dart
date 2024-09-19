import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/admin/features/admin_panel/manager/admin_panel_logic/admin_panel_logic_cubit.dart';
import 'package:gharmart/admin/features/admin_panel/manager/fetch_admin_properties/fetch_admin_properties_cubit.dart';
import 'package:gharmart/admin/features/admin_panel/manager/fetch_reports/admin_fetch_reports_cubit.dart';
import 'package:gharmart/admin/features/admin_panel/manager/fetch_users/admin_fetch_users_cubit.dart';
import 'package:gharmart/admin/features/admin_panel/pages/admin_property_detail_page.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
import 'package:gharmart/features/profile/domain/entities/profile_entity.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../features/home_listings/domain/entities/property_entity.dart';
import '../../../../features/home_listings/presentation/pages/property_details_Page.dart';
import '../../../../features/panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';
import '../widgets/admin_content.dart';
import '../widgets/admin_dashboard.dart';

class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({super.key});

  static const String routeName = "/adminPanelPage";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceConfig.get<AdminPanelLogicCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              serviceConfig.get<FetchAdminPropertiesCubit>()..fetchProperties(),
        ),
        BlocProvider(
          create: (context) =>
              serviceConfig.get<AdminFetchUsersCubit>()..fetchAllUsers(),
        ),
        BlocProvider(
          create: (context) =>
          serviceConfig.get<AdminFetchReportsCubit>()..fetchReports(),
        ),
      ],
      child: const Scaffold(
        body: Row(
          children: [
            AdminDashboard(),
            AdminContent(),
          ],
        ),
      ),
    );
  }
}