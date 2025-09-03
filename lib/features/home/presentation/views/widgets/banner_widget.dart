import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_images.dart';
class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(AppImages.offerImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}