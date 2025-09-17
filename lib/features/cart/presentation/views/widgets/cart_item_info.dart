import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/home_view_product_details/product_raiting_widget.dart';

class CartItemInfo extends StatelessWidget {
  final ProductModel productModel;
  final double ratingValue;
  const CartItemInfo({super.key, required this.productModel, required this.ratingValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          productModel.price != null ? "${productModel.price} \$" : "--",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            ProductRatingWidget(rating: ratingValue),
            const SizedBox(width: 6),
            Text(
              ratingValue.toStringAsFixed(1),
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
