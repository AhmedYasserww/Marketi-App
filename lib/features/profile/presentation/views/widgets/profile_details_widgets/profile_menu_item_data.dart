import 'package:flutter/material.dart';

class ProfileMenuItemData {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color iconColor;
  final Color titleColor;
  final bool hasToggle;
  final bool? toggleValue;
  final ValueChanged<bool>? onToggleChanged;

  ProfileMenuItemData({
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor = Colors.black87,
    this.titleColor = Colors.black87,
    this.hasToggle = false,
    this.toggleValue,
    this.onToggleChanged,
  });
}