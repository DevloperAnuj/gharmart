import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharmart/utils/my_layout_builder.dart';
import 'package:gharmart/utils/theme_data.dart';

import 'features/panel/presentation/pages/panel_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyBuilder(
      mobileView: ScreenUtilInit(
        designSize: const Size(375, 667),
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'GHAR MART',
            theme: myTheme,
            home: const PanelPage(),
          );
        },
      ),
      tabletView: ScreenUtilInit(
        designSize: const Size(768, 1024),
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'GHAR MART',
            theme: myTheme,
            home: const PanelPage(),
          );
        },
      ),
      deskView: ScreenUtilInit(
        designSize: const Size(1280, 800),
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'GHAR MART',
            theme: myTheme,
            home: const PanelPage(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBuilder(
        mobileView: Container(color: Colors.red),
        tabletView: Container(color: Colors.green),
        deskView: Container(color: Colors.blue),
      ),
    );
  }
}
