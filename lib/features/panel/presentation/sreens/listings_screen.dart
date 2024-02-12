import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Center(
        child: Icon(
          Icons.list,
          size: 100.sp,
        ),
      ),
    );
  }
}
