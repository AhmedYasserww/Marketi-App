import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/widgets/custom_empty_screen.dart';
import 'package:marketi_app/core/widgets/custom_error_widget.dart';
import 'package:marketi_app/core/widgets/custom_loading_indicator.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:marketi_app/features/cart/presentation/views/widgets/cart_item.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CustomLoadingIndicator();
        }
        if (state.errorMessage != null) {
          return CustomErrorWidget(errorMessage: state.errorMessage!);
        }
        if (state.cartItems.isEmpty) {
          return const CustomEmptyScreen(message: "Your cart is empty.");
        }

        return ListView.builder(
          itemCount: state.cartItems.length,
          itemBuilder: (context, i) {
            return CartItem(productModel: state.cartItems[i]);
          },
        );
      },
    );
  }
}

    //   BlocListener<DeleteFromCartCubit, DeleteFromCartState>(
    //   listener: (context, state) {
    //     if (state is DeleteFromCartLoading) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text("Removing item...")),
    //       );
    //     } else if (state is DeleteFromCartSuccess) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text(state.message)),
    //       );
    //
    //       // اعمل ريفرش للـ cart
    //       context.read<GetCartCubit>().getCart();
    //     } else if (state is DeleteFromCartFailure) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text(state.errorMessage)),
    //       );
    //     }
    //   },
    //   child: BlocBuilder<GetCartCubit, GetCartState>(
    //     builder: (context, state) {
    //       if (state is GetCartLoading) {
    //         return const CustomLoadingIndicator();
    //       } else if (state is GetCartSuccess) {
    //         if (state.cartProducts.isEmpty) {
    //           return const Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 46),
    //             child: CustomEmptyScreen(
    //               message: "Your cart is empty. Start adding products!",
    //             ),
    //           );
    //         }
    //         return ListView.builder(
    //           itemCount: state.cartProducts.length,
    //           itemBuilder: (context, i) {
    //             return CartItem(productModel: state.cartProducts[i]);
    //           },
    //         );
    //       } else if (state is GetCartFailure) {
    //         return CustomErrorWidget(errorMessage: state.errorMessage);
    //       } else {
    //         return const CustomEmptyScreen(
    //           message: "No products in cart yet.",
    //         );
    //       }
    //     },
    //   ),
    // );
//   }
// }
