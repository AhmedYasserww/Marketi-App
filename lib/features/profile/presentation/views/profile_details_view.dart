import 'package:flutter/material.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_details_view_body.dart';
class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});
static const String routeName = 'profile_details_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ProfileDetailsViewBody(),
    );
  }
}
