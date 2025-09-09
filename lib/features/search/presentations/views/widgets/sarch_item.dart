import 'package:flutter/material.dart';

import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/product_details_view.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.productModel});
final ProductModel productModel ;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
           productModel.thumbnail??" ",
            width: 80.0,
            height: 80.0,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
            productModel.title ?? " ",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColors.primaryColor),

        ),
        subtitle: Text(
          productModel.description?? " ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: AppColors.primaryColor),

        ),
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailsView.routeName,arguments: productModel);

        },
      ),
    );
  }
}
