import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/display_properties/display_properties_cubit.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/filter_widget.dart';

class SearchSectionMobile extends StatelessWidget {

  const SearchSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              onChanged: (text) {
                context
                    .read<DisplayPropertiesCubit>()
                    .displayPropertiesBySearch(text);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for Locations",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
            onPressed: () {
              _showAlertDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(18, 132, 142, 1),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.filter_alt),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            onPressed: () {
              //TODO: Scramble list

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(18, 132, 142, 1),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.compare_arrows),
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
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              style: const TextStyle(
                color: Colors.black,
              ),
              onChanged: (text) {
                context
                    .read<DisplayPropertiesCubit>()
                    .displayPropertiesBySearch(text);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for Locations",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
            onPressed: () {
              _showAlertDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(18, 132, 142, 1),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.filter_alt),
          ),
        ),
      ],
    );
  }
}

class SearchbarSectionDesktop extends StatelessWidget {
  const SearchbarSectionDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: TextField(
              style: const TextStyle(
                color: Colors.black,
              ),
              onChanged: (text) {
                context
                    .read<DisplayPropertiesCubit>()
                    .displayPropertiesBySearch(text);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for Locations",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: const Color.fromRGBO(18, 132, 142, 1),
        //       foregroundColor: Colors.white,
        //     ),
        //     child: const Text("Search"),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton.icon(
            onPressed: () {
              _showAlertDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(18, 132, 142, 1),
              foregroundColor: Colors.white,
            ),
            label: const Text("Modify Filter"),
            icon: const Icon(Icons.filter_alt),
          ),
        ),
      ],
    );
  }


}

Future<void> _showAlertDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    //barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return const AlertDialog(
        // <-- SEE HERE
        title: Text('Apply Filter'),
        content: FilterWidgetDesktop(),
      );
    },
  );
}