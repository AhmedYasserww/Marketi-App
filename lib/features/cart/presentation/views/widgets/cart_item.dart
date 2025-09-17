import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/home_view_product_details/product_raiting_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.productModel});
  final ProductModel productModel;

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

          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              productModel.thumbnail ?? "",
              width: 107,
              height: 108,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 107,
                  height: 108,
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 12),


          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        productModel.title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF0D1B2A),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().deleteFromCart(productModel.id.toString());
                      },
                      icon: const Icon(Icons.close, color: Colors.red),
                    )
                  ],
                ),

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

                Row(
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
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [

                    GestureDetector(
                      onTap: () {
                        final newQty = (productModel.quantity ) - 1;
                        context.read<CartCubit>().updateQuantity(productModel, newQty);
                      },
                      child: _circleButton(Icons.remove, Colors.red),
                    ),

                    const Spacer(),
                    Text(
                      '${productModel.quantity }',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Spacer(),


                    GestureDetector(
                      onTap: () {
                        final newQty = (productModel.quantity ) + 1;
                        context.read<CartCubit>().updateQuantity(productModel, newQty);
                      },
                      child: _circleButton(Icons.add, Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _circleButton(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 41,
      decoration: const BoxDecoration(
        color: Color(0xffD9E6FF),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 18),
    );
  }
}

