import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';

import '../../../../../core/widgets/custom_text_form_field_widget.dart';

class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController confirmPasswordController;
  final bool visible;
  final VoidCallback toggleVisibility;

  const ConfirmPasswordField({
    super.key,
    required this.confirmPasswordController,
    required this.visible,
    required this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      prefixIcon: const Icon(
        Icons.lock,
        color: AppColors.primaryColor,
      ),
      labelText: const Text(
        "Confirm Password",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      controller: confirmPasswordController,
      obscureText: visible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'required this field';
        }
        return null;
      },
      suffixIcon: IconButton(
        onPressed: toggleVisibility,
        icon: Icon(
          visible ? Icons.visibility_off : Icons.visibility,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
