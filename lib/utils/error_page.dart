import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 75,
            ),
            Text("Page not Found"),
          ],
        ),
      ),
    );
  }
}
