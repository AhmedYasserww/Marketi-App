import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/product_details_view.dart';
import '../../../../../core/utils/app_color.dart';

class CustomProductItem extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final double rating;
  final VoidCallback? onFavorite;
  final VoidCallback? onAdd;
  final bool showAddButton;
  final bool isFavorite;
  final ProductModel productModel;

  const CustomProductItem({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.rating ,
    this.onFavorite,
    this.onAdd,
    this.showAddButton = true,
    this.isFavorite = false,
    required this.productModel,
  });

  bool _isNetworkImage(String path) {
    return path.startsWith('http') || path.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
     Navigator.pushNamed(context, ProductDetailsView.routeName,arguments:productModel );

      },
      child: Container(
        width: 190,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      color: const Color(0xffD9E6FF),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _isNetworkImage(productImage)
                            ? Image.network(
                          productImage.replaceAll('\\', '/'),
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.broken_image,
                              size: 80,
                              color: Colors.grey,
                            );
                          },
                        )
                            : Image.asset(
                          productImage,
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: onFavorite,
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
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 24,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          productPrice,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star_border_outlined,
                          color: AppColors.primaryColor),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (showAddButton)
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        final isInCart = context.read<CartCubit>().isInCart(productModel.id.toString());

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
                              color: isInCart ? Colors.green.withOpacity(0.1) : Colors.transparent,
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
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
