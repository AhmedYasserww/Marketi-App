// import 'package:ecommerce_app/core/utils/app_color.dart';
// import 'package:ecommerce_app/core/utils/app_text_styles.dart';
// import 'package:ecommerce_app/features/auth/presentation/views/sign_up_view.dart';
// import 'package:flutter/material.dart';
//
// class DoNotHaveAnAccountWidget extends StatelessWidget {
//   const DoNotHaveAnAccountWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'لا تمتلك حساب؟',
//           style: AppTextStyles.semiBold16.copyWith(
//             color: const Color(0xFF949D9E),
//           ),
//         ),
//         const SizedBox(width: 5),
//         TextButton(
//           onPressed: () {
//              Navigator.of(context).pushNamed(SignUpView.routeName);
//           },
//           style: TextButton.styleFrom(
//             padding: EdgeInsets.zero,
//           ),
//           child: Text(
//             'قم بانشاء حساب',
//             style: AppTextStyles.semiBold16.copyWith(
//               color: AppColors.primaryColor,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
