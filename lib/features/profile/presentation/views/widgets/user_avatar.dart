import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/core/utils/app_images.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.lightPrimaryColor,
      radius: 24,
      child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(AppImages.profile)
      ),
    );
  }
}