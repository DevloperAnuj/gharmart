import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Icon(
          Icons.person,
          size: 100.sp,
        ),
      ),
    );
  }
}
