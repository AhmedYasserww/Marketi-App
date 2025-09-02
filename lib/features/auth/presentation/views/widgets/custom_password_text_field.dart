import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';

import '../../../../../Core/widgets/custom_text_form_field_widget.dart';
class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool visible;
  final VoidCallback toggleVisibility;

  const PasswordField({
    super.key,
    required this.passwordController,
    required this.visible,
    required this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      prefixIcon: const Icon(Icons.lock,color: AppColors.primaryColor,),
      labelText: const Text("Password",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),

      controller: passwordController,
      obscureText: visible,
      validator: (value) => value == null || value.isEmpty ? 'required this field' : null,
      suffixIcon: IconButton(
        onPressed: toggleVisibility,
        icon: Icon(visible ? Icons.visibility_off : Icons.visibility,color: AppColors.primaryColor),
      ),

    );
  }
}