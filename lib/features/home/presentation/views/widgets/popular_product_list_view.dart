import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/features/cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:marketi_app/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:marketi_app/features/home/presentation/manager/all_products_cubit/get_all_product_cubit.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_product_item.dart';

class PopularProductsListView extends StatelessWidget {
  const PopularProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [

        BlocListener<AddToCartCubit, AddToCartState>(
          listener: (context, state) {
            if (state is AddToCartLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("🛒 Adding to cart...")),
              );
            } else if (state is AddToCartSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("✅ ${state.message}")),
              );

              context.read<CartCubit>().getCart();
            } else if (state is AddToCartFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("❌ ${state.errorMessage}")),
              );
            }
          },
        ),


        BlocListener<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state.isLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("❤️ waiting...")),
              );
            } else if (state.successMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("✅ ${state.successMessage}")),
              );
            } else if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("❌ ${state.errorMessage}")),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<GetAllProductCubit, GetAllProductState>(
        builder: (context, state) {
          if (state is GetAllProductLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
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
                itemCount: products.length > 10 ? 10 : products.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return CustomProductItem(
                    productModel: product,
                    rating: product.rating ?? 0,
                    productName: product.title ?? "No Name",
                    productImage: (product.images?.isNotEmpty ?? false)
                        ? product.images!.first
                        : "assets/images/Smart_Watch_test.png",
                    productPrice: "${product.price ?? 0} LE",
                    showAddButton: true,


                    onAdd: () {
                      context
                          .read<AddToCartCubit>()
                          .addToCart(productId: product.id.toString());
                    },


                    onFavorite: () {
                      context
                          .read<FavoriteCubit>()
                          .addToFavorite(product.id.toString());
                    },
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
