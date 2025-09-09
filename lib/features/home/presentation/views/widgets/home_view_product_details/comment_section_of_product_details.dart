import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

class CommentsSectionOfProductDetails extends StatelessWidget {
  final ProductModel productModel;

  const CommentsSectionOfProductDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Comments : ",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600,color: AppColors.primaryColor),
        ),
       const SizedBox(height: 8,),
        if (productModel.reviews != null && productModel.reviews!.isNotEmpty)

          SizedBox(
            height: 130,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productModel.reviews!.length,
              itemBuilder: (context, index) {
                final review = productModel.reviews![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    review.comment ?? "No Comment",
                    style:const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    //   maxLines: 2,

                  ),
                );
              },
            ),
          )
        else
          const Text("No comments available"),
      ],
    );
  }
}