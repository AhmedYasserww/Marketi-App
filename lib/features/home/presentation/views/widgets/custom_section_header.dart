import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600,color: AppColors.primaryColor)),
        TextButton(
          onPressed: onViewAll,
          child: const Text("View all",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColors.lightPrimaryColor),),
        ),
      ],
    );
  }
}
