import 'package:flutter/material.dart';
import 'package:marketi_app/core/widgets/custom_app_bar.dart';
import 'package:marketi_app/features/home/data/models/categories_model/CategoryModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/view_all_screen_widgets/view_all_categories_grid_view.dart';
class ViewAllCategoriesViewBody extends StatelessWidget {
  const ViewAllCategoriesViewBody({super.key,required this.categoriesList});
final List<CategoryModel> categoriesList;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 16),
          const CustomAppBar(title: "Categories"),
          const SizedBox(height: 12),
          Expanded(
            child: ViewAllCategoriesGridView(categoriesList: categoriesList,),
          ),
        ],
      ),
    );
  }
}
