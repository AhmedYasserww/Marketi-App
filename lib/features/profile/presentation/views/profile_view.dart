import 'package:flutter/material.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/menu_list.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
static const String routeName='profile_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const ProfileHeader(),
            Expanded(
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const MenuList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}