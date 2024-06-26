import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/presentation/manager/favorite_property/favorite_property_cubit.dart';
import 'package:gharmart/features/panel/presentation/widgets/home_screen_widgets/my_app_bar.dart';
import 'package:gharmart/features/profile/presentation/manager/fetch_connections/fetch_connections_cubit.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

import '../../../panel/presentation/widgets/home_screen_widgets/property_card_widget.dart';

class FavoritePropertiesPage extends StatelessWidget {
  const FavoritePropertiesPage({super.key});

  static const String routeName = "/myfav";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<FavoritePropertyCubit>()..fetchFavoriteProperties(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<FetchConnectionsCubit>(),
        ),
      ],
      child: const MyBuilder(
        mobileView: FavoritePropertiesPageMobile(),
        tabletView: FavoritePropertiesPageTablet(),
        deskView: FavoritePropertiesPageDesktop(),
      ),
    );
  }
}

class FavoritePropertiesPageMobile extends StatelessWidget {
  const FavoritePropertiesPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/lbg.png'),
          repeat: ImageRepeat.repeatY,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              title: FittedBox(
                child: Text(
                  "Your Favorite Properties",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            const FavoritePropertiesListWidgetMobile(),
          ],
        ),
      ),
    );
  }
}

class FavoritePropertiesPageTablet extends StatelessWidget {
  const FavoritePropertiesPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/lbg.png'),
          repeat: ImageRepeat.repeatY,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              title: FittedBox(
                child: Text(
                  "Your Favorite Properties",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            const FavoritePropertiesListWidgetTablet(),
          ],
        ),
      ),
    );
  }
}

class FavoritePropertiesPageDesktop extends StatelessWidget {
  const FavoritePropertiesPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/lbg.png'),
          repeat: ImageRepeat.repeatY,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              title: Text(
                "Your Favorite Properties",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(),
                  ),
                  FavoritePropertiesListWidgetDesktop(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritePropertiesListWidgetDesktop extends StatelessWidget {
  const FavoritePropertiesListWidgetDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: BlocBuilder<FavoritePropertyCubit, FavoritePropertyState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.favoritePropertyList.length,
                itemBuilder: (c, i) {
                  final property = state.favoritePropertyList[i];
                  return PropertyCardWidgetDesktop(
                    property: property,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class FavoritePropertiesListWidgetMobile extends StatelessWidget {
  const FavoritePropertiesListWidgetMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: BlocBuilder<FavoritePropertyCubit, FavoritePropertyState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.favoritePropertyList.length,
                itemBuilder: (c, i) {
                  final property = state.favoritePropertyList[i];
                  return PropertyCardWidgetMobile(
                    property: property,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class FavoritePropertiesListWidgetTablet extends StatelessWidget {
  const FavoritePropertiesListWidgetTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: BlocBuilder<FavoritePropertyCubit, FavoritePropertyState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.favoritePropertyList.length,
                itemBuilder: (c, i) {
                  final property = state.favoritePropertyList[i];
                  return PropertyCardWidgetTablet(
                    property: property,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
