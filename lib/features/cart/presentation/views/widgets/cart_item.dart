import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/home_view_product_details/product_raiting_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final ratingValue = productModel.rating ?? 0.0;
    final priceText = productModel.price != null
        ? "${productModel.price!.toStringAsFixed(2)} EGP"
        : "--";

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
          // الصورة
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: productModel.thumbnail != null && productModel.thumbnail!.isNotEmpty
                ? Image.network(
              productModel.thumbnail!,
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
            )
                : Container(
              width: 107,
              height: 108,
              color: Colors.grey[200],
              child: const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          ),

          const SizedBox(width: 12),

          // بيانات المنتج
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // العنوان + ايقونة الفافوريت
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان (يأخذ المساحة المتاحة ويظهر في سطرين كحد أقصى)
                    Expanded(
                      child: Text(
                        productModel.title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF0D1B2A), // عدّل اللون لو حبيت
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // أيقونة المفضلة
                    const Icon(Icons.favorite, color: Colors.red),
                  ],
                ),

                const SizedBox(height: 6),

                // الـ category مع مسافة وفاصلة إذا احتجت
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

                // صف السعر + الريتينج (النجوم + القيمة الرقمية)
                Row(
                  children: [
                    // السعر
                    Text(
                      priceText,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),

                    const Spacer(),

                    // النجوم + قيمة الريتينج
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
                ),

                const SizedBox(height: 10),

                // أزرار الحذف/الكمية/إضافة
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
