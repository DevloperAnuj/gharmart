import 'package:flutter/material.dart';
import 'package:image_collage/image_collage.dart';

List<Img> imagesList = [
  const Img(
      image:
          "https://images.unsplash.com/photo-1417721955552-a49ac2d334e8?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDF8TThqVmJMYlRSd3N8fGVufDB8fHx8fA%3D%3D"),
  const Img(
      image:
          "https://images.unsplash.com/photo-1472201248592-1241c92256ff?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  const Img(
      image:
          "https://media.istockphoto.com/id/1941927396/photo/green-old-door.webp?s=2048x2048&w=is&k=20&c=9dE1p-8gwcu2u7TGPRvJhNFtqQWLVjfM3UtzcXSKixo="),
  const Img(
      image:
          "https://images.unsplash.com/photo-1464398204810-9d6e5076f0ef?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  const Img(
      image:
          "https://images.unsplash.com/photo-1503554855957-bed27c962921?q=80&w=1633&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
];

class PropertyImageCollageWidget extends StatelessWidget {
  const PropertyImageCollageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      fit: FlexFit.loose,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ImageCollage(
          images: imagesList,
          onClick: (clickedImage, imagesList) {
            print(clickedImage.image);
          },
        ),
      ),
    );
  }
}
