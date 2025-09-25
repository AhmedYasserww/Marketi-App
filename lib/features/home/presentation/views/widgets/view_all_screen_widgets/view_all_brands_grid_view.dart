import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/brands_model/BrandModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_brand_item.dart';
class ViewAllBrandsGridView extends StatelessWidget {
  const ViewAllBrandsGridView({super.key, required this.brandsList});
final List<BrandModel> brandsList;
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      itemCount: brandsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final brand = brandsList[index];
        return CustomBrandItem(
            brandName: brand.name ?? "Unknown",
            emoji: brand.emoji ?? "❓",
        );

      },
    );
  }
}
