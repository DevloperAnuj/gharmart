import 'package:get_it/get_it.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:gharmart/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/display_properties/display_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/favorite_property/favorite_property_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
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

}
