import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/features/home/data/models/filter_product_model/filter_product_model.dart';
import 'package:marketi_app/features/home/presentation/manager/filter_product/get_filter_product_cubit.dart';
import 'package:marketi_app/features/home/presentation/views/view_all_products_view.dart';

class CustomCategoryItem extends StatelessWidget {
  final String categoryName;
  final String categoryImage;


  const CustomCategoryItem({
    super.key,
    required this.categoryName,
    required this.categoryImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () async {
      //   final cubit = context.read<GetAllProductBySingleCategoryCubit>();
      //
      //   await cubit.fetchAllProductsBySingleCategory(category: categoryName ?? "");
      //
      //   final state = cubit.state;
      //
      //   if (state is GetAllProductBySingleCategorySuccess) {
      //     Navigator.pushNamed(context, ViewAllProductsView.routeName, arguments: state.products);
      //   } else if (state is GetAllProductBySingleCategoryFailure) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text(state.errorMessage)),
      //     );
      //   }
      // },
     // filter product => بيأدى نفس الغرض انا كاتبه للمارسه ممكن استخنى عن اللى فوق واكتب ده مكانه
        onTap: ()async{
        final cubit = context.read<GetFilterProductCubit>();

        await cubit.fetchFilteredProducts(FilterProductsRequest(category: categoryName));

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
                width: 96,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    categoryImage,
                    fit: BoxFit.cover,


                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              categoryName,
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
