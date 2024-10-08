import 'package:get_it/get_it.dart';
import 'package:gharmart/admin/features/admin_panel/manager/admin_panel_logic/admin_panel_logic_cubit.dart';
import 'package:gharmart/admin/features/admin_panel/manager/fetch_admin_properties/fetch_admin_properties_cubit.dart';
import 'package:gharmart/admin/features/admin_panel/manager/fetch_reports/admin_fetch_reports_cubit.dart';
import 'package:gharmart/admin/features/admin_panel/manager/fetch_users/admin_fetch_users_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/otp_sign_in/otp_sign_in_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/send_otp_cubit/send_otp_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/display_properties/display_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/favorite_property/favorite_property_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_property_by_id/fetch_property_by_id_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/filter/listing_filter_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/get_user_properties/get_user_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/report_property/report_property_cubit.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_connections/fetch_connections_cubit.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import 'package:gharmart/features/properties/presentation/manager/add_property_temp_cubit/add_property_cubit.dart';
import 'package:gharmart/features/properties/presentation/manager/delist_property/delist_property_cubit.dart';
import 'package:gharmart/features/properties/presentation/manager/upload_property_database/upload_property_database_cubit.dart';
import 'package:gharmart/features/subscription/presentation/manager/connections_management/connection_management_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceConfig = GetIt.instance;

void configSetup() {
  //Utils
  serviceConfig.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );

  //Cubits
  serviceConfig.registerLazySingleton<SignInCubit>(
    () => SignInCubit(),
  );

  serviceConfig.registerLazySingleton<SignUpCubit>(
    () => SignUpCubit(),
  );

  serviceConfig.registerLazySingleton<OtpVerificationSignInCubit>(
    () => OtpVerificationSignInCubit(),
  );

  serviceConfig.registerLazySingleton<SendOtpCubit>(
    () => SendOtpCubit(),
  );

  serviceConfig.registerLazySingleton<ResetPasswordCubit>(
    () => ResetPasswordCubit(),
  );

  serviceConfig.registerLazySingleton<FetchProfileCubit>(
    () => FetchProfileCubit(),
  );

  serviceConfig.registerLazySingleton<ListingFilterCubit>(
    () => ListingFilterCubit(),
  );

  serviceConfig.registerLazySingleton<AddPropertyTempCubit>(
    () => AddPropertyTempCubit(),
  );

  serviceConfig.registerLazySingleton<UploadPropertyDatabaseCubit>(
    () => UploadPropertyDatabaseCubit(),
  );

  serviceConfig.registerLazySingleton<FetchPropertiesCubit>(
    () => FetchPropertiesCubit(),
  );

  serviceConfig.registerLazySingleton<DisplayPropertiesCubit>(
    () => DisplayPropertiesCubit(),
  );

  serviceConfig.registerLazySingleton<GetUserPropertiesCubit>(
    () => GetUserPropertiesCubit(),
  );

  serviceConfig.registerLazySingleton<ReportPropertyCubit>(
    () => ReportPropertyCubit(),
  );

  serviceConfig.registerLazySingleton<FavoritePropertyCubit>(
    () => FavoritePropertyCubit(),
  );

  serviceConfig.registerLazySingleton<ConnectionManagementCubit>(
    () => ConnectionManagementCubit(),
  );

  serviceConfig.registerLazySingleton<FetchConnectionsCubit>(
    () => FetchConnectionsCubit(),
  );

  serviceConfig.registerLazySingleton<DelistPropertyCubit>(
    () => DelistPropertyCubit(),
  );

  //ADMIN PANEL
  serviceConfig.registerLazySingleton<AdminPanelLogicCubit>(
    () => AdminPanelLogicCubit(),
  );

  serviceConfig.registerLazySingleton<FetchAdminPropertiesCubit>(
    () => FetchAdminPropertiesCubit(),
  );

  serviceConfig.registerLazySingleton<AdminFetchUsersCubit>(
    () => AdminFetchUsersCubit(),
  );

  serviceConfig.registerLazySingleton<AdminFetchReportsCubit>(
    () => AdminFetchReportsCubit(),
  );

  serviceConfig.registerLazySingleton<FetchPropertyByIdCubit>(
    () => FetchPropertyByIdCubit(),
  );
}
