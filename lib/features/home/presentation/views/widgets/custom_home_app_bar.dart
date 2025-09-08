import 'package:flutter/material.dart';
import 'package:marketi_app/core/local_data/save_user_date.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/core/utils/app_images.dart';

import 'package:marketi_app/features/auth/data/model/auth_model.dart';


class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AuthModel?>(
      future: AppPreferences.getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            "Loading...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Text(
            "Hi Guest!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          );
        }

        final user = snapshot.data!.user;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightPrimaryColor,
                  radius: 24,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(AppImages.profile)
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Hi ${user.name}!",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                size: 32,
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
