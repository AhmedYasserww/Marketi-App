import 'package:flutter/material.dart';
import 'package:marketi_app/features/cart/presentation/views/cart_view.dart';

import '../../../../../../core/utils/app_color.dart';


class CustomAppbarForProductDetails extends StatelessWidget {
  const CustomAppbarForProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24,right: 30,left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffB2CCFF).withOpacity(0.7)),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppColors.primaryColor,
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, CartView.routeName);
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffB2CCFF).withOpacity(0.7)),
              ),
              child: const Icon(
                Icons.shopping_cart_rounded,
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
