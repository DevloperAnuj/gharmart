import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/fetch_admin_properties/fetch_admin_properties_cubit.dart';

class FetchPropertiesTemp extends StatelessWidget {
  const FetchPropertiesTemp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAdminPropertiesCubit, FetchAdminPropertiesState>(
      builder: (context, state) {
        return const SizedBox(height: 10);
      },
    );
  }
}