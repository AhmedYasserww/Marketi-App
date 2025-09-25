import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_details_widgets/profile_menu_item_data.dart';

class ProfileMenuItem extends StatelessWidget {
  final ProfileMenuItemData data;
  final bool isLast;

  const ProfileMenuItem({
    super.key,
    required this.data,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: data.onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    data.icon,
                    size: 20,
                    color: data.iconColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: data.titleColor,
                    ),
                  ),
                ),
                if (data.hasToggle) ...[
                  Switch(
                    value: data.toggleValue ?? false,
                    onChanged: data.onToggleChanged,
                    activeColor:  AppColors.primaryColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ] else ...[
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey.shade400,
                  ),
                ],
              ],
            ),
          ),
        ),
        if (!isLast)
          Container(
            margin: const EdgeInsets.only(left: 60),
            height: 1,
            color: Colors.grey.shade100,
          ),
      ],
    );
  }
}
