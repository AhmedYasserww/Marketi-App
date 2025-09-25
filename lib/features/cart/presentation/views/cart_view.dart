import 'package:flutter/material.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const String routeName = 'CartView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CartViewBody(),
      ),
    );
  }
}
