import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:image_collage/image_collage.dart';

List<Img> imagesxList = [
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

class PropertyImageCollageWidgetDesktop extends StatelessWidget {
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      // fit: FlexFit.loose,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ImageCollage(
          images: imageList.map((image) => Img(image: image)).toList(),
          onClick: (clickedImage, imagesList) {
            showAdaptiveDialog(
              context: context,
              builder: (context) =>
                  PropertyImageCarouselWidgetDesktop(imageList: imageList),
            );
          },
        ),
      ),
    );
  }

  const PropertyImageCollageWidgetDesktop({
    super.key,
    required this.imageList,
  });
}

class PropertyImageCollageWidgetMobile extends StatelessWidget {
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ImageCollage(
        images: imageList.map((image) => Img(image: image)).toList(),
        onClick: (clickedImage, imagesList) {
          showAdaptiveDialog(
            context: context,
            builder: (context) =>
                PropertyImageCarouselWidgetMobile(imageList: imageList),
          );
        },
      ),
    );
  }

  const PropertyImageCollageWidgetMobile({
    super.key,
    required this.imageList,
  });
}

class PropertyImageCollageWidgetTablet extends StatelessWidget {
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ImageCollage(
        images: imageList.map((image) => Img(image: image)).toList(),
        onClick: (clickedImage, imagesList) {
          showAdaptiveDialog(
            context: context,
            builder: (context) =>
                PropertyImageCarouselWidgetTablet(imageList: imageList),
          );
        },
      ),
    );
  }

  const PropertyImageCollageWidgetTablet({
    super.key,
    required this.imageList,
  });
}

class PropertyImageCarouselWidgetDesktop extends StatelessWidget {
  const PropertyImageCarouselWidgetDesktop({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
      child: FlutterCarousel(
        items: imageList
            .map(
              (e) => Stack(
                children: [
                  Center(
                    child: Image.network(
                      e,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      "GharMarket",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
        options: CarouselOptions(
          enableInfiniteScroll: true,
        ),
      ),
    );
  }
}

class PropertyImageCarouselWidgetMobile extends StatelessWidget {
  const PropertyImageCarouselWidgetMobile({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      items: imageList
          .map(
            (e) => Stack(
              children: [
                Center(
                  child: Image.network(
                    e,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
                Center(
                  child: Text(
                    "GharMarket",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
      options: CarouselOptions(
        enableInfiniteScroll: true,
      ),
    );
  }
}

class PropertyImageCarouselWidgetTablet extends StatelessWidget {
  const PropertyImageCarouselWidgetTablet({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: FlutterCarousel(
        items: imageList
            .map(
              (e) => Stack(
                children: [
                  Center(
                    child: Image.network(
                      e,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      "GharMart",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
        options: CarouselOptions(
          enableInfiniteScroll: true,
        ),
      ),
    );
  }
}
