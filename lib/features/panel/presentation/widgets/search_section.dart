import 'package:flutter/material.dart';

class SearchSectionMobile extends StatelessWidget {

  const SearchSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 250,
          height: 80,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SearchBar(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 1, horizontal: 20),
              ),
              leading: Icon(
                Icons.pin_drop,
                color: Colors.red,
              ),
              elevation: MaterialStatePropertyAll(2),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune),
          style: IconButton.styleFrom(
            iconSize: 25,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          style: IconButton.styleFrom(
            iconSize: 25,
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
        const SizedBox(
          width: 600,
          height: 100,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SearchBar(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 1, horizontal: 20),
              ),
              leading: Icon(
                Icons.pin_drop,
                color: Colors.red,
              ),
              elevation: MaterialStatePropertyAll(2),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune),
          style: IconButton.styleFrom(
            iconSize: 25,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          style: IconButton.styleFrom(
            iconSize: 25,
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
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: SearchBar(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 1, horizontal: 20),
              ),
              leading: Icon(
                Icons.pin_drop,
                color: Colors.red,
              ),
              elevation: MaterialStatePropertyAll(2),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune),
          style: IconButton.styleFrom(
            iconSize: 25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: 50,
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
