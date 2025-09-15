import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/home_view_product_details/product_raiting_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14, left: 14, bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
      width: double.infinity,
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
          Image.network(
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

          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  children:  [
                    Text(
                      productModel.title ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
                const Text('84 Diapers'),
                 Row(
                  children:  [
                    Row(
                      children: [
                        const Text('Price: '),
                        Text(productModel.price.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    const Spacer(),
                    ProductRatingWidget(rating: productModel.rating ?? 0),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    _circleButton(Icons.delete, Colors.red),
                    const Spacer(),
                    const Text('1', style: TextStyle(fontSize: 16)),
                    const Spacer(),
                    _circleButton(Icons.add, Colors.green),
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
