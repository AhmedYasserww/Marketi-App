import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/categories_model/CategoryModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/custom_category_item.dart';
class ViewAllCategoriesGridView extends StatelessWidget {
  const ViewAllCategoriesGridView({super.key, required this.categoriesList});
final List<CategoryModel> categoriesList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      itemCount: categoriesList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        final category = categoriesList[index];
        return CustomCategoryItem(
          categoryImage:category.image ?? "https://dummyimage.com/600x400/cccccc/000000&text=No+Image",
          categoryName: category.name ?? "Unknown",
        );

      },
    );
  }
}
