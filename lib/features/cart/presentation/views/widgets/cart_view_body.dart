import 'package:flutter/material.dart';
import 'package:marketi_app/core/widgets/custom_app_bar.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_item_list_view.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_summary.dart';


class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14 ,),
        const CustomAppBar(title: "Cart"),
        const Padding(
          padding: EdgeInsets.all(14.0),
          child: Text(
            'Products in Cart',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: CartItemListView(),
        ),
        const CartSummary(),
      ],
    );
  }
}


