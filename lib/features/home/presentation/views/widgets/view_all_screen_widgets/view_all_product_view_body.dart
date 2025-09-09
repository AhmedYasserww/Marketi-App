import 'package:flutter/material.dart';
import 'package:marketi_app/core/widgets/custom_app_bar.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_product_item.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

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
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: productsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                final product = productsList[index];
                return CustomProductItem(
                  productName: product.title ?? "Unnamed Product",
                  productPrice: "${product.price} EGP",
                  productImage: product.thumbnail ?? "",
                  rating: product.rating ?? 0,
                  onFavorite: () {

                  },
                  onAdd: () {

                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
