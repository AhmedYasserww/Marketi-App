import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/brands_model/BrandModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/view_all_screen_widgets/view_all_brands_grid_view.dart';

import '../../../../../../core/widgets/custom_app_bar.dart';
class ViewAllBrandsViewBody extends StatelessWidget {
  const ViewAllBrandsViewBody({super.key, required this.brandsList});
final List<BrandModel> brandsList;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 16),
          const CustomAppBar(title: "Brands"),
          const SizedBox(height: 12),
          Expanded(
            child: ViewAllBrandsGridView(
              brandsList: brandsList,
            ),
          ),
        ],
      ),
    );
  }
}
