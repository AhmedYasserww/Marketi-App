import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'circle_button.dart';

class CartItemQuantity extends StatelessWidget {
  final ProductModel productModel;
  const CartItemQuantity({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            final newQty = (productModel.quantity) - 1;
            context.read<CartCubit>().updateQuantity(productModel, newQty);
          },
          child: CircleButton(icon: Icons.remove, color: Colors.red),
        ),
        const Spacer(),
        Text('${productModel.quantity}', style: const TextStyle(fontSize: 16)),
        const Spacer(),
        GestureDetector(
          onTap: () {
            final newQty = (productModel.quantity) + 1;
            context.read<CartCubit>().updateQuantity(productModel, newQty);
          },
          child: CircleButton(icon: Icons.add, color: Colors.green),
        ),
      ],
    );
  }
}
