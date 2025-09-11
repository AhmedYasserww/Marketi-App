import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_product_item.dart';

class ViewAllProductsGridView extends StatelessWidget {
  const ViewAllProductsGridView({
    super.key,
    required this.productsList,
  });

  final List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    if (productsList.isEmpty) {
      return const Center(
        child: Text(
          "No products available for this category now.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    return GridView.builder(
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
          productModel: productsList[index],
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
    );
  }
}