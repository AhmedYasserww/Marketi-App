import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

class CartItemHeader extends StatelessWidget {
  final ProductModel productModel;
  const CartItemHeader({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        ),
      ],
    );
  }
}
