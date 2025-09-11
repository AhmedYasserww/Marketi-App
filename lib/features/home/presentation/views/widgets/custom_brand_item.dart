import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/features/home/data/models/filter_product_model/filter_product_model.dart';
import 'package:marketi_app/features/home/presentation/manager/filter_product/get_filter_product_cubit.dart';
import 'package:marketi_app/features/home/presentation/views/view_all_products_view.dart';

class CustomBrandItem extends StatelessWidget {
  final String brandName;
  final String emoji;

  const CustomBrandItem({
    super.key,
    required this.brandName,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        final cubit = context.read<GetFilterProductCubit>();

        await cubit.fetchFilteredProducts(FilterProductsRequest(brand: brandName));

        final state = cubit.state;

        if (state is GetFilterProductSuccess) {
          Navigator.pushNamed(context, ViewAllProductsView.routeName, arguments: state.filterProductsList);
        } else if (state is GetFilterProductFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage),backgroundColor: Colors.red,),
          );
        }
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 100,
                width: 105,
                child: Center(
                  child: Text(
                    emoji.isNotEmpty ? emoji : "❓",
                    style: const TextStyle(
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              brandName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
