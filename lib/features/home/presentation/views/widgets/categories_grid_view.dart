import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/home/presentation/manager/all_categories_cubit/get_all_categories_cubit.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_category_item.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllCategoriesCubit, GetAllCategoriesState>(
      listener: (context, state) {
        if (state is GetAllCategoriesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("⚠️ Error: ${state.errorMessage}")),
          );
        }
      },
      builder: (context, state) {
        if (state is GetAllCategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllCategoriesSuccess) {
          final categories = state.categories;

          return GridView.builder(
            itemCount: 6,
            //itemCount: categories.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return CustomCategoryItem(

                categoryName: category.name ?? "Unknown",
                categoryImage: category.image?? "https://dummyimage.com/600x400/cccccc/000000&text=No+Ima",
              );
            },
          );
        } else {
          return const Center(child: Text("No categories found."));
        }
      },
    );
  }
}
