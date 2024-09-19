import 'package:gharmart/admin/features/admin_panel/pages/admin_panel_page.dart';
import 'package:gharmart/admin/features/admin_panel/pages/admin_property_detail_page.dart';
import 'package:gharmart/features/auth/presentation/pages/auth_page.dart';
import 'package:gharmart/features/auth/presentation/pages/auth_wrapper_page.dart';
import 'package:gharmart/features/auth/presentation/pages/reset_password_page.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/home_listings/presentation/pages/favorite_properties_page.dart';
import 'package:gharmart/features/home_listings/presentation/pages/property_details_by_id_page.dart';
import 'package:gharmart/features/landing_page/presentation/pages/landing_page.dart';
import 'package:gharmart/features/panel/presentation/sreens/listings_screen.dart';
import 'package:gharmart/features/panel/presentation/sreens/profile_screen.dart';
import 'package:gharmart/features/profile/presentation/pages/connections_property_page.dart';
import 'package:gharmart/features/profile/presentation/pages/purchase_connections_page.dart';
import 'package:gharmart/features/properties/presentation/pages/add_property_page.dart';
import 'package:gharmart/features/home_listings/presentation/pages/edit_property_details.dart';
import 'package:gharmart/features/home_listings/presentation/pages/property_details_Page.dart';
import 'package:gharmart/features/panel/presentation/pages/panel_page.dart';
import 'package:gharmart/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:gharmart/main.dart';
import 'package:gharmart/utils/error_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) =>
            adminMode ? const AdminPanelPage() : const LandingPage(),
        // builder: (context, state) => const PropertyDetailsByIdPage(
        //   propertyId: "3dca7dcf-8e0a-4b48-97b4-0cb71c8f4f04",
        // ),
      ),
      GoRoute(
        path: ResetPasswordPage.routeName,
        name: ResetPasswordPage.routeName,
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: AuthWrapperPage.routeName,
        name: AuthWrapperPage.routeName,
        builder: (context, state) => const AuthWrapperPage(),
      ),
      GoRoute(
        path: AuthPage.routeName,
        name: AuthPage.routeName,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: PanelPage.routeName,
        name: PanelPage.routeName,
        builder: (context, state) => const PanelPage(),
      ),
      GoRoute(
        path: ProfilePage.routeName,
        name: ProfilePage.routeName,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: MyPropertiesListingPage.routeName,
        name: MyPropertiesListingPage.routeName,
        builder: (context, state) => const MyPropertiesListingPage(),
      ),
      GoRoute(
        path: PropertyDetailsPage.routeName,
        name: PropertyDetailsPage.routeName,
        builder: (context, state) => PropertyDetailsPage(
          property: state.extra as PropertyEntity,
        ),
      ),
      GoRoute(
        path: "${PropertyDetailsByIdPage.routeName}/:propertyId",
        name: PropertyDetailsByIdPage.routeName,
        builder: (context, state) =>  PropertyDetailsByIdPage(
          propertyId: state.pathParameters["propertyId"]!,
        ),
      ),
      GoRoute(
        path: AdminPropertyDetailsPage.routeName,
        name: AdminPropertyDetailsPage.routeName,
        builder: (context, state) => AdminPropertyDetailsPage(
          property: state.extra as PropertyEntity,
        ),
      ),
      GoRoute(
        path: PurchaseConnectionPage.routeName,
        name: PurchaseConnectionPage.routeName,
        builder: (context, state) => const PurchaseConnectionPage(),
      ),
      GoRoute(
        path: AddPropertyPage.routeName,
        name: AddPropertyPage.routeName,
        builder: (context, state) => const AddPropertyPage(),
      ),
      GoRoute(
        path: EditPropertyDetailsPage.routeName,
        name: EditPropertyDetailsPage.routeName,
        builder: (context, state) => const EditPropertyDetailsPage(),
      ),
      GoRoute(
        path: EditProfilePage.routeName,
        name: EditProfilePage.routeName,
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: FavoritePropertiesPage.routeName,
        name: FavoritePropertiesPage.routeName,
        builder: (context, state) => const FavoritePropertiesPage(),
      ),
      GoRoute(
        path: ConnectionsPropertiesPage.routeName,
        name: ConnectionsPropertiesPage.routeName,
        builder: (context, state) => const ConnectionsPropertiesPage(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}
