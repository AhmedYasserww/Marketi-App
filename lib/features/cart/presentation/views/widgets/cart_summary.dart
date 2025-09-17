import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/widgets/custom_button.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final itemsCount = state.cartItems.fold<int>(
          0,
              (sum, item) => sum + (item.quantity ),
        );

        final totalPrice = state.cartItems.fold<double>(
          0,
              (sum, item) => sum + ((item.price ?? 0) * (item.quantity )),
        );

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xffB2CCFF).withOpacity(0.7)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xffB2CCFF).withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Subtotal (',
                    style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '$itemsCount',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    ' items)',
                    style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    '\$ ${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              CustomButton(
                text: "Checkout",
                onTap: () {

                },
              ),
            ],
          ),
        );
      },
    );
  }
}
