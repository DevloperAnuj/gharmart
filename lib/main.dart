import 'package:flutter/material.dart';
import 'package:gharmart/navigation/my_router.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/constants.dart';
import 'package:gharmart/utils/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const bool adminMode = false;

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
      title: adminMode ? "GHARMARKET ADMIN" : 'GHAR MARKET',
      theme: myTheme,
      routerConfig: MyRouter.router,
    );
  }
}
