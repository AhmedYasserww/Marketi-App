import 'package:flutter/material.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_item_header.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_item_image.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_item_info.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_item_quantity.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
class CartItem extends StatelessWidget {
  final ProductModel productModel;
  const CartItem({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    final ratingValue = productModel.rating ?? 0.0;

    return Container(
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffB2CCFF).withOpacity(0.7)),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffB2CCFF).withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          CartItemImage(imageUrl: productModel.thumbnail ?? ""),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartItemHeader(productModel: productModel),
                const SizedBox(height: 6),
                Text(
                  productModel.category ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                CartItemInfo(productModel: productModel, ratingValue: ratingValue),
                const SizedBox(height: 10),
                CartItemQuantity(productModel: productModel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
