import 'package:flutter/material.dart';
import 'package:gharmart/navigation/my_router.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/constants.dart';
import 'package:gharmart/utils/theme_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: MyConstants.supabaseUrl,
    anonKey: MyConstants.supabaseAnonKey,
  );
  configSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'GHAR MART',
      // theme: myTheme,
      routerConfig: MyRouter.router,
    );
  }
}
