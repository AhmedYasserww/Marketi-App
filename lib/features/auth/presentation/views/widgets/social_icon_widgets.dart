import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi_app/core/utils/app_images.dart';

class SocialIconsWidget extends StatelessWidget {
  const SocialIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Or Continue With",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          color: Color(0xff51526C),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(AppImages.googleLogo),
            const SizedBox(width: 20),
            _buildSocialIcon(AppImages.facebookLogo),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Container(
      width: 46,
      height: 46,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: SvgPicture.asset(assetPath),
    );
  }
}
