import 'package:flutter/material.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_details_widgets/profile_avatar.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_details_widgets/profile_name_section.dart';
class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         ProfileAvatar(),
         SizedBox(height: 16),
         ProfileNameSection(),
      ],
    );
  }
}
