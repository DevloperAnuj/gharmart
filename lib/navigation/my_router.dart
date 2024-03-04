import 'package:gharmart/features/auth/presentation/pages/auth_page.dart';
import 'package:gharmart/features/auth/presentation/pages/auth_wrapper_page.dart';
import 'package:gharmart/features/properties/presentation/pages/add_property_page.dart';
import 'package:gharmart/features/home_listings/presentation/pages/edit_property_details.dart';
import 'package:gharmart/features/home_listings/presentation/pages/property_details_Page.dart';
import 'package:gharmart/features/panel/presentation/pages/panel_page.dart';
import 'package:gharmart/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:gharmart/utils/error_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
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
        routes: [
          GoRoute(
            path: PropertyDetailsPage.routeName,
            name: PropertyDetailsPage.routeName,
            builder: (context, state) => const PropertyDetailsPage(),
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
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}
