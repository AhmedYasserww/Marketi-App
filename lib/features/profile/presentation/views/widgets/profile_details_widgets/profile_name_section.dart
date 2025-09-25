import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/profile/presentation/manager/profile_details_cubit.dart';

class ProfileNameSection extends StatelessWidget {
  const ProfileNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
      builder: (context, state) {
        if (state is ProfileDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileDetailsSuccess) {
          final message = state.profileModel.message;
          return Column(
            children: [
              Text(
                message?.name ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message?.email ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message?.phone ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        } else if (state is ProfileDetailsFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
