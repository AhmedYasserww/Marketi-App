import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import the package

import 'custom_appbar_for_product_details.dart';

class ImageStackWidget extends StatelessWidget {
  final PageController pageController;
  final List<String> images;

  const ImageStackWidget({
    super.key,
    required this.pageController,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height * 0.44,
          child: PageView(
            controller: pageController,
            children: images
                .map((imageUrl) => CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
            ))
                .toList(),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: images.length,
              effect: const ExpandingDotsEffect(
                dotWidth: 15,
                dotHeight: 10,
                spacing: 16,
                expansionFactor: 4,
                dotColor: Colors.grey,
                activeDotColor: Color(0xff002B7F),
              ),
            ),
          ),
        ),
        const CustomAppbarForProductDetails(),
      ],
    );
  }
}
