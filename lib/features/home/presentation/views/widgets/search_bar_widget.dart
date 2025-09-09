import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi_app/core/utils/app_images.dart';
import 'package:marketi_app/features/search/presentations/views/search_view.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: TextFormField(
            readOnly: true,
            onTap: () {
              Navigator.of(context).pushNamed(SearchView.routeName);
            },
            decoration: InputDecoration(
              hintText: "What are you looking for?",
              hintStyle: const TextStyle(
                color: Color(0xff929BAB),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppImages.searchIcon),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
              const EdgeInsets.symmetric( horizontal: 16),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(),
              errorBorder: buildBorder(Colors.red),
              focusedErrorBorder: buildBorder(Colors.red),
              border: buildBorder(),
            ),
          ),
        ),

        const SizedBox(width: 10),


        GestureDetector(
          onTap: () {

          },
          child: Container(
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xB2B2CCFF), width: 3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppImages.filterIcon),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color ?? const Color(0xB2B2CCFF),
        width: 3,
      ),
    );
  }
}
