import 'package:bloc/bloc.dart';
import 'package:marketi_app/features/profile/data/models/ProfileModel.dart';
import 'package:marketi_app/features/profile/data/repos/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_details_state.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  ProfileDetailsCubit(this.profileRepo) : super(ProfileDetailsInitial());

  final ProfileRepo profileRepo;

  Future<void> getProfile() async {
    emit(ProfileDetailsLoading());
    try {
      final result = await profileRepo.getUserData();
      result.fold(
            (failure) => emit(ProfileDetailsFailure(errorMessage: failure.errorMessage)),
            (profile) => emit(ProfileDetailsSuccess(profileModel: profile)),
      );
    } catch (e) {
      emit(ProfileDetailsFailure(errorMessage: e.toString()));
    }
  }
}
