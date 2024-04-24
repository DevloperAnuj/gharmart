import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/utils/my_layout_builder.dart';

import '../../../../utils/config_file.dart';
import '../../../profile/presentation/manager/fetch_profile/fetch_profile_cubit.dart';
import '../widgets/home_screen_widgets/my_app_bar.dart';
import '../widgets/profile_screen_widgets/membership_card_widget.dart';
import '../widgets/profile_screen_widgets/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routeName = "/profilepage";

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceConfig.get<FetchProfileCubit>(),
      child: Container(
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
          appBar: AppBar(
            elevation: 2,
            title: const Text("Gharmarket"),
            titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
          ),
          body: const MyBuilder(
            mobileView: ProfileScreenMobile(),
            tabletView: ProfileScreenTablet(),
            deskView: ProfileScreenDesktop(),
          ),
        ),
      ),
    );
  }
}

class ProfileScreenMobile extends StatelessWidget {

  const ProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileWidgetMobile(),
      ],
    );
  }
}

class ProfileScreenTablet extends StatelessWidget {
  const ProfileScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileWidgetMobile(),
      ],
    );
  }
}

class ProfileScreenDesktop extends StatelessWidget {
  const ProfileScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ProfileWidgetDesktop(),
        VerticalDivider(),
        Expanded(
          flex: 2,
          child: SizedBox(),
        ),
      ],
    );
  }
}
