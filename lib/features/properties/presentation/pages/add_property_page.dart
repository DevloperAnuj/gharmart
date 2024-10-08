import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/properties/presentation/manager/add_property_temp_cubit/add_property_cubit.dart';
import 'package:gharmart/features/properties/presentation/manager/upload_property_database/upload_property_database_cubit.dart';
import 'package:gharmart/features/properties/presentation/widgets/choose_image_gallary.dart';
import 'package:gharmart/utils/config_file.dart';
import 'package:gharmart/utils/constants.dart';
import 'package:gharmart/utils/my_layout_builder.dart';
import 'package:go_router/go_router.dart';

import '../widgets/add_property_form.dart';

class AddPropertyPage extends StatelessWidget {
  const AddPropertyPage({super.key});

  static const String routeName = "/addproperty";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: serviceConfig.get<AddPropertyTempCubit>(),
        ),
        BlocProvider.value(
          value: serviceConfig.get<UploadPropertyDatabaseCubit>(),
        ),
      ],
      child: const MyBuilder(
        mobileView: AddPropertyPageMobile(),
        tabletView: AddPropertyPageTablet(),
        deskView: AddPropertyPageDesktop(),
      ),
    );
  }
}

class AddPropertyPageMobile extends StatelessWidget {
  const AddPropertyPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              // leading: const SizedBox.shrink(),
              title: Text(
                "Add Property",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            const ChooseImageAlbumMobile(),
            const AddPropertyFormMobile(),
          ],
        ),
      ),
    );
  }
}

class AddPropertyToReviewButton extends StatelessWidget {
  const AddPropertyToReviewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocConsumer<UploadPropertyDatabaseCubit,
            UploadPropertyDatabaseState>(
          listener: (context, state) {
            if (state is UploadPropertyDatabaseFailed) {
              MyConstants.mySnackBar(
                context,
                message: state.err,
                color: Colors.red,
              );
            }
            if (state is UploadPropertyDatabaseSuccess) {
              context.read<AddPropertyTempCubit>().setToInit();
              MyConstants.mySnackBar(
                context,
                message: "Property Submitted For Review",
                color: Colors.green,
              );
              Future.delayed(const Duration(seconds: 2), () {
                context.pop();
              });
            }
          },
          builder: (context, state) {
            if (state is UploadPropertyDatabaseLoading) {
              return const CircularProgressIndicator();
            }
            return ElevatedButton.icon(
              onPressed: () {
                context
                    .read<UploadPropertyDatabaseCubit>()
                    .uploadPropertyToDatabase(context);
              },
              icon: const Icon(Icons.upload),
              label: const Text("List Property"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddPropertyPageTablet extends StatelessWidget {
  const AddPropertyPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              // leading: const SizedBox.shrink(),
              title: Text(
                "Add Property",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            const ChooseImageAlbumMobile(),
            const AddPropertyFormMobile(),
          ],
        ),
      ),
    );
  }
}

class AddPropertyPageDesktop extends StatelessWidget {
  const AddPropertyPageDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Builder(builder: (context) {
          return Column(
            children: [
              AppBar(
                // leading: const SizedBox.shrink(),
                title: Text(
                  "Add Property",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                actions: const [
                  //Need Help Button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text("For Help Related Listing Property Call : 7887 302172"),
                  ),
                ],
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      ChooseImageAlbumDesktop(),
                      AddPropertyForm(),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
