import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/home_view_product_details/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});

  static const String routeName = "ProductDetailsView";
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsViewBody(productModel: productModel),
    );
  }
}
