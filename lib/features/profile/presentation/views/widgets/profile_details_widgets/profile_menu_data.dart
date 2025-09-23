import 'package:flutter/material.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_details_widgets/profile_menu_item_data.dart';

class ProfileMenuData {
  static List<ProfileMenuItemData> menuItems = [

    ProfileMenuItemData(
      icon: Icons.credit_card_outlined,
      title: 'Subscription & Payment',
      onTap: () => print('Subscription & Payment tapped'),
    ),
    ProfileMenuItemData(
      icon: Icons.dark_mode_outlined,
      title: 'Dark Mode',
      hasToggle: true,
      toggleValue: false,
      onToggleChanged: (value) => print('Dark Mode: $value'),
    ),
    ProfileMenuItemData(
      icon: Icons.star_outline,
      title: 'Rate Us',
      onTap: () => print('Rate Us tapped'),
    ),
    ProfileMenuItemData(
      icon: Icons.feedback_outlined,
      title: 'Provide Feedback',
      onTap: () => print('Provide Feedback tapped'),
    ),
    ProfileMenuItemData(
      icon: Icons.logout,
      title: 'Log Out',
      onTap: () => print('Log Out tapped'),
      iconColor: Colors.red,
      titleColor: Colors.red,
    ),
  ];
}