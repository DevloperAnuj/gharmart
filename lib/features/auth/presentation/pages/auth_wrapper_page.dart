import 'package:flutter/material.dart';
import 'package:gharmart/features/auth/presentation/pages/auth_page.dart';
import 'package:gharmart/features/panel/presentation/pages/panel_page.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthWrapperPage extends StatelessWidget {
  const AuthWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: serviceConfig.get<SupabaseClient>().auth.onAuthStateChange,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          if (snapshot.data!.session == null) {
            return const AuthPage();
          } else {
            return const PanelPage();
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
