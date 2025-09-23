import 'package:flutter/material.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_details_widgets/profile_menu_data.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_details_widgets/profile_menu_item.dart';
class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          ...ProfileMenuData.menuItems.map((item) => ProfileMenuItem(
            data: item,
            isLast: item == ProfileMenuData.menuItems.last,
          )),
          const SizedBox(height: 20),
          // Bottom indicator
          Container(
            width: 134,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}