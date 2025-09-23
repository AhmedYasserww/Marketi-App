import 'package:flutter/material.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/user_avatar.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/welcome_text.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F6F6),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const UserAvatar(),
          const SizedBox(width: 12),
          const WelcomeText(),
          const Spacer(),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}