import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';

class CustomCategoryItem extends StatelessWidget {
  final String categoryName;
  final String categoryImage;

  const CustomCategoryItem({
    super.key,
    required this.categoryName,
    required this.categoryImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 105,
              width: 96,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  categoryImage,
                  fit: BoxFit.cover,


                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            categoryName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
