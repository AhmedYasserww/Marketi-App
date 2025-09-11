import 'package:flutter/material.dart';
import 'package:marketi_app/core/widgets/custom_app_bar.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/search_bar_widget.dart';
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
          const CustomAppBar(title: "Products"),
          const SizedBox(height: 12),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 14),
            child:  SearchBarWidget(),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ViewAllProductsGridView(productsList: productsList),
          ),
        ],
      ),
    );
  }
}


