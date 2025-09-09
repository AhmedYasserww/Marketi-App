import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/view_all_screen_widgets/view_all_product_view_body.dart';

class ViewAllProductsView extends StatelessWidget {
  const ViewAllProductsView({super.key});

  static const String routeName = 'ViewAllProductsView';
  @override
  Widget build(BuildContext context) {
    final productsList = ModalRoute.of(context)!.settings.arguments as List<ProductModel>;

    return Scaffold(
      body: ViewAllProductsViewBody(productsList: productsList),
    );
  }
}
