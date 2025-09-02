import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/core/utils/app_images.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onCheckBoxPressed;
  final double size;

  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onCheckBoxPressed,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCheckBoxPressed(!isChecked),
      borderRadius: BorderRadius.circular(4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.lightPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: isChecked
            ?  Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset(AppImages.checkIcon),
            )
            : null,
      ),
    );
  }
}
