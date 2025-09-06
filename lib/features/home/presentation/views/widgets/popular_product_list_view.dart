import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/home/presentation/manager/all_products_cubit/get_all_product_cubit.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_product_item.dart';

class PopularProductsListView extends StatelessWidget {
  const PopularProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductCubit, GetAllProductState>(
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
            height: 240,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final product = products[index];
                return CustomProductItem(
                  productName: product.title ?? "No Name",
                  productImage: (product.images?.isNotEmpty ?? false)
                      ? product.images!.first
                      : "assets/images/Smart_Watch_test.png",
                  productPrice: "${product.price ?? 0} LE",
                  showAddButton: false,
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
    );
  }
}
