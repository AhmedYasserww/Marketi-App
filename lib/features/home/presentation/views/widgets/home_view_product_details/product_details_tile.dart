import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';


class ProductDetailsTile extends StatelessWidget {
  const ProductDetailsTile(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: AppColors.primaryColor),
      ),
      children: <Widget>[
        ListTile(
          title: Text(description,style: const TextStyle(fontSize: 16,color:  Color(0xFF6C6C6C))
          ),
        ),
      ],
    );
  }
}
