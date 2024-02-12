import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MyBuilder(
      mobileView: SearchSectionMobile(),
      tabletView: SearchSectionTablet(),
      deskView: SearchSectionDesktop(),
    );
  }
}

class SearchSectionMobile extends StatelessWidget {
  const SearchSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 250.w,
          height: 80.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: SearchBar(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.w),
              ),
              leading: const Icon(
                Icons.pin_drop,
                color: Colors.red,
              ),
              elevation: const MaterialStatePropertyAll(2),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune),
          style: IconButton.styleFrom(
            iconSize: 25.sp,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          style: IconButton.styleFrom(
            iconSize: 25.sp,
            backgroundColor: Colors.indigoAccent,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

class SearchSectionTablet extends StatelessWidget {
  const SearchSectionTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 600.w,
          height: 100.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: SearchBar(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.w),
              ),
              leading: const Icon(
                Icons.pin_drop,
                color: Colors.red,
              ),
              elevation: const MaterialStatePropertyAll(2),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune),
          style: IconButton.styleFrom(
            iconSize: 25.sp,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          style: IconButton.styleFrom(
            iconSize: 25.sp,
            backgroundColor: Colors.indigoAccent,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

class SearchSectionDesktop extends StatelessWidget {
  const SearchSectionDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 700.w,
          height: 100.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: SearchBar(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.w),
              ),
              leading: const Icon(
                Icons.pin_drop,
                color: Colors.red,
              ),
              elevation: const MaterialStatePropertyAll(2),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune),
          style: IconButton.styleFrom(
            iconSize: 25.sp,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: SizedBox(
            height: 50.h,
            width: 200.w,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.search),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
                foregroundColor: Colors.white,
                textStyle: Theme.of(context).textTheme.titleMedium,
              ),
              label: const Text("Search"),
            ),
          ),
        ),
      ],
    );
  }
}
