import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketi_app/features/profile/presentation/manager/profile_details_cubit.dart';
import 'package:marketi_app/features/profile/presentation/manager/upload_image_cubit/upload_image_cubit.dart';
import 'package:marketi_app/features/profile/presentation/manager/upload_image_cubit/upload_image_state.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, uploadState) {
        return BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
          builder: (context, profileState) {
            String? imageUrl;

            // ✅ الأولوية للصورة اللي بترفع دلوقتي
            if (uploadState is UploadImageSuccess) {
              imageUrl = uploadState.imageUrl;
            }
            // ✅ لو مفيش رفع حاليا، نعرض صورة الـ getProfile
            else if (profileState is ProfileDetailsSuccess) {
              imageUrl = profileState.profileModel.message?.fullImageUrl;
            }

            return Stack(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF4F8EF7).withOpacity(0.1),
                        const Color(0xFF9C27B0).withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: uploadState is UploadImageLoading
                          ? const Center(child: CircularProgressIndicator())
                          : (imageUrl != null && imageUrl.isNotEmpty
                          ? Image.network(imageUrl, fit: BoxFit.cover)
                          : const Icon(Icons.person,
                          size: 60, color: Colors.grey)),
                    ),
                  ),
                ),
                // زرار Edit
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                      if (pickedFile != null) {
                        context.read<UploadImageCubit>().uploadImage(pickedFile.path);
                      }
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4F8EF7),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
