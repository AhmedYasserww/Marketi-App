import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../core/utils/app_color.dart';

class ProductRatingWidget extends StatelessWidget {
  final double rating;
  const ProductRatingWidget({super.key, required this.rating}) ;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: AppColors.primaryColor,
      ),
      itemCount: 5,
      itemSize: 24.0,
      unratedColor: Colors.grey.shade300,
      direction: Axis.horizontal,
    );
  }
}
