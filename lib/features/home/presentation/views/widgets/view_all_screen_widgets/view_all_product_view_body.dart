import 'package:flutter/material.dart';
import 'package:marketi_app/core/widgets/custom_app_bar.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_product_item.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/view_all_screen_widgets/view_all_products_grid_view.dart';

class ViewAllProductsViewBody extends StatelessWidget {
  final List<ProductModel> productsList;

  const ViewAllProductsViewBody({
    super.key,
    required this.productsList,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 16),
          const CustomAppBar(title: "Popular Products"),
          const SizedBox(height: 12),
          Expanded(
            child: ViewAllProductsGridView(productsList: productsList),
          ),
        ],
      ),
    );
  }
}


