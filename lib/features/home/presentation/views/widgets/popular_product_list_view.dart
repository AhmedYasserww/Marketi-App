import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_product_item.dart';
class PopularProductsListView extends StatelessWidget {
  const PopularProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    const int itemCount = 5;

    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return const CustomProductItem(
            productName: 'Smart Watch',
            productImage: 'assets/images/Smart_Watch_test.png',
            productPrice: "499 LE",
            showAddButton: false,
          );
        },
      ),
    );
  }
}