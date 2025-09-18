// add_to_cart_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

class AddToCartButton extends StatelessWidget {
  final ProductModel productModel;
  final VoidCallback? onAdd;

  const AddToCartButton({
    super.key,
    required this.productModel,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final isInCart =
        context.read<CartCubit>().isInCart(productModel.id.toString());

        return GestureDetector(
          onTap: isInCart ? null : onAdd,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isInCart ? Colors.green : AppColors.lightPrimaryColor,
                width: 2,
              ),
              color:
              isInCart ? Colors.green.withOpacity(0.1) : Colors.transparent,
            ),
            child: Center(
              child: Text(
                isInCart ? "Added" : "Add",
                style: TextStyle(
                  color: isInCart ? Colors.green : AppColors.lightPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
