import 'package:flutter/material.dart';
import 'package:gharmart/navigation/my_router.dart';
import 'package:gharmart/utils/theme_data.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'GHAR MART',
      theme: myTheme,
      routerConfig: MyRouter.router,
    );
  }
}
