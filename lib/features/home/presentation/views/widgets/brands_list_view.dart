import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_brand_item.dart';
class BrandsListView extends StatelessWidget {
  const BrandsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount:6,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return const CustomBrandItem();
        },
      ),
    );
  }
}
