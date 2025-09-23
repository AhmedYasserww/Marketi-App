import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/widgets/custom_empty_screen.dart';
import 'package:marketi_app/features/cart/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:marketi_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:marketi_app/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:marketi_app/features/favorite/presentation/views/widgets/custom_favorite_item.dart';


class FavoriteItemGridView extends StatelessWidget {
  const FavoriteItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null) {
          return Center(child: Text(state.errorMessage!));
        }
        if (state.favoriteItems.isEmpty) {
          return const CustomEmptyScreen(message: "No favorite items yet.");
        }

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          itemCount: state.favoriteItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final product = state.favoriteItems[index];
            final isFavorite = context.read<FavoriteCubit>().isInFavorite(product.id.toString());

            return CustomFavoriteItem(
              productModel: product,
              rating: product.rating ?? 0,
              productImage: product.thumbnail ?? "",
              productPrice: product.price?.toString() ?? "0",
              productName: product.title ?? "",
              showAddButton: false,
              isFavorite: true,
              onFavorite: () {
                if (isFavorite) {
                  context.read<FavoriteCubit>().deleteFromFavorite(product.id.toString());
                }
              },

            );
          },
        );
      },
    );
  }
}

