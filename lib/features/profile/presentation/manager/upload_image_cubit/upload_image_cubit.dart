import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/profile/data/repos/profile_repo.dart';
import 'package:marketi_app/features/profile/presentation/manager/upload_image_cubit/upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final ProfileRepo profileRepo;

  UploadImageCubit(this.profileRepo) : super(UploadImageInitial());

  Future<void> uploadImage(String filePath) async {
    emit(UploadImageLoading());

    final result = await profileRepo.uploadImage(filePath);

    result.fold(
          (failure) => emit(UploadImageFailure(failure.errorMessage)),
          (_) async {
        final profileResult = await profileRepo.getUserData();
        profileResult.fold(
              (failure) => emit(UploadImageFailure(failure.errorMessage)),
              (profile) {
            final fullUrl = "https://supermarket-dan1.onrender.com/api/v1/${profile.message?.image}";
            emit(UploadImageSuccess(fullUrl));
          },
        );
      },
    );
  }

}
