import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi_app/core/utils/app_color.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Center(
              child: SvgPicture.asset(
            image,
          )),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color:AppColors.primaryColor),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style:  const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color:AppColors.primaryColor ),
          ),
        ),
      ],
    );
  }
}
