
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/properties/presentation/manager/add_property_temp_cubit/add_property_cubit.dart';
import 'package:gharmart/features/properties/presentation/widgets/choose_image_gallary.dart';
import 'package:gharmart/utils/config_file.dart';

import '../widgets/add_property_form.dart';

class AddPropertyPage extends StatelessWidget {

  const AddPropertyPage({super.key});

  static const String routeName = "addproperty";

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceConfig.get<AddPropertyTempCubit>(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Add Property",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      ChooseImageAlbum(),
                      AddPropertyForm(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
