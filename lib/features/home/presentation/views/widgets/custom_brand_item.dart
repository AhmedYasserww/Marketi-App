import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';

class CustomBrandItem extends StatelessWidget {
  final String brandName;
  final String emoji;

  const CustomBrandItem({
    super.key,
    required this.brandName,
    required this.emoji,
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
              height: 100,
              width: 105,
              child: Center(
                child: Text(
                  emoji.isNotEmpty ? emoji : "❓",
                  style: const TextStyle(
                    fontSize: 60,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            brandName,
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
