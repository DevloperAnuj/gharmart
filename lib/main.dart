import 'package:flutter/material.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GHAR MART',
      theme: myTheme,
      home: const MyBuilder(
        mobileView: MobilePanelPage(),
        tabletView: TabletPanelPage(),
        deskView: DesktopPanelPage(),
      ),
    );
  }
}
