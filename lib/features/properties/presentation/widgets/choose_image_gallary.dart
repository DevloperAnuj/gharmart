import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gharmart/features/properties/presentation/manager/add_property_temp_cubit/add_property_cubit.dart';

class ChooseImageAlbum extends StatelessWidget {
  const ChooseImageAlbum({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              context.read<AddPropertyTempCubit>().selectingImages();
            },
            icon: const Icon(Icons.camera_alt),
            label: const Text("Upload Images"),
          ),
          const ListviewForGallery(),
          const Text("👆🏻 Tap on Selected Images To Remove")
        ],
      ),
    );
  }
}

class ListviewForGallery extends StatelessWidget {
  const ListviewForGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<AddPropertyTempCubit, AddPropertyTempState>(
          builder: (context, state) {
            if (state.pics.isEmpty) {
              return const Icon(
                Icons.cloud_upload,
                size: 100,
              );
            }
            return GridView.builder(
              itemCount: state.pics.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      context.read<AddPropertyTempCubit>().removingImage(i);
                    },
                    child: Image.memory(
                      state.pics[i],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
