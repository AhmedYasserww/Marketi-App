import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/service_locator/service_locator.dart';
import 'package:marketi_app/features/cart/data/repo/cart_repo_imp.dart';
import 'package:marketi_app/features/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const String routeName = 'CartView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CartViewBody(),
      ),
    );
  }
}
