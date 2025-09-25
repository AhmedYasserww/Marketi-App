import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';

class CustomNavigateToRegister extends StatelessWidget {
  const CustomNavigateToRegister({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Are you new in Marketi ",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            "Sign Up?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
