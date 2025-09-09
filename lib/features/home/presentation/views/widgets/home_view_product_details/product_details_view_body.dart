import 'package:flutter/material.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/home_view_product_details/desc_of_product_details.dart';
import 'package:marketi_app/features/home/presentation/views/widgets/home_view_product_details/image_stack_widget.dart';

class ProductDetailsViewBody extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetailsViewBody({super.key, required this.productModel});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool isLoading = true;
  late List<String> images;

  @override
  void initState() {
    super.initState();
    images = widget.productModel.images ?? [];
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });

    _pageController.addListener(() {
      final pageIndex = _pageController.page?.round() ?? 0;
      if (_currentIndex != pageIndex) {
        setState(() {
          _currentIndex = pageIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        isLoading
            ? SizedBox(
            height: height * 0.4,
            child: const Center(
              child: CircularProgressIndicator(),
            ))
            : Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ImageStackWidget(
                        pageController: _pageController,
                        images: images.isNotEmpty ? images : ['https://via.placeholder.com/400'],
                      ),
            ),
        Expanded(
          child: Container(
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: DescOfProductDetails(productModel: widget.productModel,),
          ),
        ),
      ],
    );
  }
}
