import 'package:flutter/material.dart';

class MyConstants {
  static const String supabaseAnonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImViZ2NsbnZ0eHlzcHFyb3dpbmlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg3NjMwMjcsImV4cCI6MjAyNDMzOTAyN30.lfewDkcGzSLhrAjrkA2qiubVNmk3GMCXgr1EKjhtWk4";
  static const String supabaseUrl = "https://ebgclnvtxyspqrowinip.supabase.co";

  static void mySnackBar(
    BuildContext context, {
    required String message,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
