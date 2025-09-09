import 'package:flutter/material.dart';
import 'package:marketi_app/core/widgets/custom_button.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/home_view_product_details/product_details_tile.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/home_view_product_details/product_raiting_widget.dart';
import '../../../../../../core/utils/app_color.dart';
import 'comment_section_of_product_details.dart';

class DescOfProductDetails extends StatelessWidget {
  const DescOfProductDetails({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final double rating = productModel.rating ?? 0;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productModel.title ?? " ",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "Rating: ",style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600,  color: AppColors.primaryColor,),),
               const  SizedBox(width: 4,),
                Text(
                    rating.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,

                    )),
                  const Spacer(),
                ProductRatingWidget(rating: rating),
                const SizedBox(width: 8,),
              ],
            ),
const SizedBox(height: 8,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Price: ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  '${productModel.price.toString()} \$',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),

              ],
            ),
            const SizedBox(height: 16),
            ProductDetailsTile(
              title: 'Description',
              description: productModel.description ?? " ",
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  "Category: ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  productModel.category ?? " ",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "Brand: ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  productModel.brand ?? " ",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "QR Code:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                height: 150,
                child: productModel.meta != null
                    ? Image.network(productModel.meta!.qrCode.toString())
                    : const Center(
                  child: Text("QR Code not available"),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CommentsSectionOfProductDetails(productModel: productModel),
            CustomButton(
              text: "+ Add To Cart",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
