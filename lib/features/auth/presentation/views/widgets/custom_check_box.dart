
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi_app/core/utils/app_images.dart';

import '../../../../../core/utils/app_color.dart';
class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key,  required this.isChecked, required this.onCheckBoxPressed });
final bool isChecked;
final ValueChanged<bool> onCheckBoxPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onCheckBoxPressed(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
          height: 24,
          duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color:isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side:  BorderSide(width: 1.50, color:isChecked ? Colors.transparent : const Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child:isChecked?Padding(
          padding: const EdgeInsets.all(2),
          child: SvgPicture.asset(AppImages.checkIcon),
        ) :
            SizedBox()
      ),
    );
  }
}
