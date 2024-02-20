import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gharmart/features/home_listings/presentation/pages/edit_property_details.dart';
import 'package:gharmart/features/home_listings/presentation/pages/property_details_Page.dart';
import 'package:gharmart/features/panel/presentation/pages/panel_page.dart';
import 'package:gharmart/utils/error_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PanelPage(),
      ),
      GoRoute(
        path: PropertyDetailsPage.routeName,
        name: PropertyDetailsPage.routeName,
        builder: (context, state) => const PropertyDetailsPage(),
      ),
      GoRoute(
        path: EditPropertyDetailsPage.routeName,
        name: EditPropertyDetailsPage.routeName,
        builder: (context, state) => const EditPropertyDetailsPage(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}
