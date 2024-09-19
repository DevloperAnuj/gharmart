import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/fetch_admin_properties/fetch_admin_properties_cubit.dart';
import 'admin_property_card.dart';

class PendingPropertiesList extends StatelessWidget {
  const PendingPropertiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAdminPropertiesCubit, FetchAdminPropertiesState>(
      builder: (context, state) {
        if (state.pendingProperties.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (c, i) {
              final property = state.pendingProperties[i];
              return AdminPropertyCardWidget(property: property);
            },
            itemCount: state.pendingProperties.length,
          );
        }
        return const Center(
          child: Icon(Icons.hourglass_empty),
        );
      },
    );
  }
}

class ApprovedPropertiesList extends StatelessWidget {
  const ApprovedPropertiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAdminPropertiesCubit, FetchAdminPropertiesState>(
      builder: (context, state) {
        if (state.approvedProperties.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (c, i) {
              final property = state.approvedProperties[i];
              return AdminPropertyCardWidget(property: property);
            },
            itemCount: state.approvedProperties.length,
          );
        }
        return const Center(
          child: Icon(Icons.hourglass_empty),
        );
      },
    );
  }
}

class DelistedPropertiesList extends StatelessWidget {
  const DelistedPropertiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAdminPropertiesCubit, FetchAdminPropertiesState>(
      builder: (context, state) {
        if (state.delistProperties.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (c, i) {
              final property = state.delistProperties[i];
              return AdminPropertyCardWidget(property: property);
            },
            itemCount: state.delistProperties.length,
          );
        }
        return const Center(
          child: Icon(Icons.hourglass_empty),
        );
      },
    );
  }
}

class WithheldPropertiesList extends StatelessWidget {
  const WithheldPropertiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAdminPropertiesCubit, FetchAdminPropertiesState>(
      builder: (context, state) {
        if (state.withheldProperties.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (c, i) {
              final property = state.withheldProperties[i];
              return AdminPropertyCardWidget(property: property);
            },
            itemCount: state.withheldProperties.length,
          );
        }
        return const Center(
          child: Icon(Icons.hourglass_empty),
        );
      },
    );
  }
}