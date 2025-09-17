import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:marketi_app/features/cart/presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:marketi_app/features/home/presentation/manager/all_products_cubit/get_all_product_cubit.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_product_item.dart';

class PopularProductsListView extends StatelessWidget {
  const PopularProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Adding to cart...")),
          );
        } else if (state is AddToCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );

          // 🔥 هنا بعد النجاح استدعي getCart عشان يجيب المنتجات المحدثة
          context.read<GetCartCubit>().getCart();
        } else if (state is AddToCartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("❌ ${state.errorMessage}")),
          );
        }
      },
      child: BlocBuilder<GetAllProductCubit, GetAllProductState>(
        builder: (context, state) {
          if (state is GetAllProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllProductFailure) {
            return Center(
              child: Text(
                "Failed: ${state.errorMessage}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is GetAllProductSuccess) {
            final products = state.products;

            return SizedBox(
              height: 280,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return CustomProductItem(
                    onAdd: () {
                      context
                          .read<AddToCartCubit>()
                          .addToCart(productId: product.id.toString());
                    },
                    productModel: state.products[index],
                    rating: product.rating ?? 0,
                    productName: product.title ?? "No Name",
                    productImage: (product.images?.isNotEmpty ?? false)
                        ? product.images!.first
                        : "assets/images/Smart_Watch_test.png",
                    productPrice: "${product.price ?? 0} LE",
                    showAddButton: true,
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text("No products available"),
            );
          }
        },
      ),
    );
  }
}

