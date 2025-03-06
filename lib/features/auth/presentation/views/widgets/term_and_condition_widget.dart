//
// import 'package:flutter/material.dart';
// import 'package:marketi_app/features/auth/presentation/views/widgets/custom_check_box.dart';
//
// class TermsAndConditionWidget extends StatefulWidget {
//   const TermsAndConditionWidget({super.key, required this.onTermsAccepted});
// final ValueChanged<bool> onTermsAccepted;
//   @override
//   State<TermsAndConditionWidget> createState() => _TermsAndConditionWidgetState();
// }
//
// class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
//   bool isTermsAccepted = false;
//   @override
//   Widget build(BuildContext context) {
//     return  Row(
//       children: [
//         CustomCheckBox(
//           onCheckBoxPressed: (value){
//            isTermsAccepted=value;
//             widget.onTermsAccepted(value);
//             setState(() {});
//
//           },
//           isChecked:isTermsAccepted,
//        ),
//         const SizedBox(width: 16,),
//         Expanded(
//           child: RichText(
//             text:TextSpan(
//             children: [
//               TextSpan(
//                 text: 'من خلال إنشاء حساب ، فإنك توافق على ',
//                 style: AppTextStyles.semiBold13.copyWith(color: const Color(0xFF949D9E),),
//               ),
//               TextSpan(
//                 text: 'الشروط والأحكام',
//                 style: AppTextStyles.semiBold13.copyWith(color: AppColors.lightPrimaryColor,),
//               ),
//               const TextSpan(
//                 text: ' ',
//                 style: AppTextStyles.semiBold13
//               ),
//               TextSpan(
//                 text: 'الخاصة',
//                 style: AppTextStyles.semiBold13.copyWith(color: AppColors.lightPrimaryColor,),
//               ),
//               const TextSpan(
//                 text: ' ',
//                 style:AppTextStyles.semiBold13
//               ),
//               TextSpan(
//                 text: 'بنا',
//                 style: AppTextStyles.semiBold13.copyWith(color: AppColors.lightPrimaryColor,),
//               ),
//             ],
//           ),
//           ),
//         ),
//       ],
//     );
//   }
// }
