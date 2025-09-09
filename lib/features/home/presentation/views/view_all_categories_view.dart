import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/categories_model/CategoryModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/view_all_screen_widgets/view_all_categories_view_body.dart';
class ViewAllCategoriesView extends StatelessWidget {
  const ViewAllCategoriesView({super.key});
static const String routeName='ViewAllCategoriesView';
  @override
  Widget build(BuildContext context) {
    final categoriesList = ModalRoute.of(context)!.settings.arguments as List<CategoryModel>;
    return  Scaffold(

      body:ViewAllCategoriesViewBody(categoriesList: categoriesList,) ,
    );
  }
}
