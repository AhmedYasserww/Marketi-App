import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/custom_check_box.dart';

class CustomRememberMe extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CustomRememberMe({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isChecked,
          onCheckBoxPressed: onChanged,
        ),
        const SizedBox(width: 5),
        const Text(
          "Remember me",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        const Text(
          "Forgot Password?",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.lightPrimaryColor,
          ),
        ),
      ],
    );
  }
}
