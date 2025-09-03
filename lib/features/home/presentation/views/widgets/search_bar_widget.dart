import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi_app/core/utils/app_images.dart';
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "What are you looking for?",
        hintStyle: const TextStyle(color: Color(0xff929BAB),fontSize: 16, fontWeight: FontWeight.w400),
        prefixIcon: SvgPicture.asset(AppImages.searchIcon),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(AppImages.filterIcon),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(Colors.red),
        focusedErrorBorder: buildBorder(Colors.red),
        border:  buildBorder(),
      ),
    );
  }
  OutlineInputBorder buildBorder([color]){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? const    Color(0xB2B2CCFF),width: 3),
    );
  }
}