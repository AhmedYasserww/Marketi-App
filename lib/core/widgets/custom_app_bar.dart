import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/core/utils/app_images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
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
          Text( title,style: const TextStyle(color: AppColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w600),),
          const CircleAvatar(
            backgroundColor: AppColors.lightPrimaryColor,
            radius: 24,
            child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AppImages.profile)
            ),
          ),
        ],
      ),
    );
  }
}