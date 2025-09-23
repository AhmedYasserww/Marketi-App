import 'package:flutter/material.dart';

class MenuItemData {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  MenuItemData({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}