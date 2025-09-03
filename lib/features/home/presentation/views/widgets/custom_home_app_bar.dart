import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/core/utils/app_images.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.lightPrimaryColor,
              radius: 24,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AppImages.profile),
              ),
            ),
             SizedBox(width: 10),
            Text(
              "Hi Yousef!",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600,color: AppColors.primaryColor),
            ),

          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_outlined,size: 32,color: AppColors.lightPrimaryColor,),
        )
      ],
    );
  }
}