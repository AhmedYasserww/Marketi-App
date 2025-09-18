import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:marketi_app/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

class AddToFavoriteButton extends StatelessWidget {
  final ProductModel productModel;

  const AddToFavoriteButton({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isInFavorite =
        context.watch<FavoriteCubit>().isInFavorite(productModel.id.toString());

        return InkWell(
          onTap: () {
            if (isInFavorite) {
              context
                  .read<FavoriteCubit>()
                  .deleteFromFavorite(productModel.id.toString());
            } else {
              // ✅ نمرر الـ productModel كامل مش بس الـ id
              context.read<FavoriteCubit>().addToFavorite(productModel.id.toString());
            }
          },
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                )
              ],
            ),
            child: Icon(
              isInFavorite ? Icons.favorite : Icons.favorite_border,
              size: 24,
              color: isInFavorite ? AppColors.primaryColor : Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
