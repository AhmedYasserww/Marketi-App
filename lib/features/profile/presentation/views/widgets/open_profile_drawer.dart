import 'package:flutter/material.dart';
import 'package:marketi_app/features/navigation_bar/presentation/views/widgets/navigation_bar_body.dart';
import 'package:marketi_app/features/profile/presentation/views/profile_view.dart';

void openProfileDrawer(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Profile",
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return const Align(
        alignment: Alignment.centerRight,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child:  ProfileView(),
        ),
      );
    },
    transitionBuilder: (_, animation, __, child) {
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}