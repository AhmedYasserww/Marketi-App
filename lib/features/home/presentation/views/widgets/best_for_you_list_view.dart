import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_product_item.dart';
class BestForYouListView extends StatelessWidget {
  const BestForYouListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return const CustomProductItem(
            rating: 4.9,
            productName: 'Black JBL Airbods',
            productPrice: "799 LE",
            productImage: "assets/images/Air_Buds_test.png",
          );
        },
      ),
    );
  }
}