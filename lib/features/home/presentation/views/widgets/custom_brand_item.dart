import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';

class CustomBrandItem extends StatelessWidget {
  final String brandName;
  final String imageUrl;

  const CustomBrandItem({
    super.key,
    required this.brandName,
    required this.imageUrl,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:Image.asset(
                  imageUrl,
                )
              //   imageUrl.isNotEmpty
              //       ? Image.network(
              //     imageUrl,
              //     fit: BoxFit.cover,
              //     errorBuilder: (_, __, ___) =>
              //         Image.asset("assets/images/SONY_Brand_test.png"),
              //   )
              //       : Image.asset("assets/images/SONY_Brand_test.png"),
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
