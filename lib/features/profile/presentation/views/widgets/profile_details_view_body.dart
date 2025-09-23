

import 'package:flutter/material.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_details_widgets/profile_info_sec.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_details_widgets/profile_menu_section.dart';

import '../../../../home/presentation/views/widgets/home_view_product_details/custom_appbar_for_product_details.dart';

class ProfileDetailsViewBody extends StatelessWidget {
  const ProfileDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Column(
        children: [
          CustomAppbarForProductDetails(),

          ProfileInfoSection(),
          SizedBox(height: 30),
          Expanded(
            child: ProfileMenuSection(),
          ),
        ],
      ),
    );
  }
}





















