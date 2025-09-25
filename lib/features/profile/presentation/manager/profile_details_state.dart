part of 'profile_details_cubit.dart';

@immutable
sealed class ProfileDetailsState {}

final class ProfileDetailsInitial extends ProfileDetailsState {}
final class ProfileDetailsLoading extends ProfileDetailsState {}
final class ProfileDetailsSuccess extends ProfileDetailsState {
  final ProfileModel profileModel;
  ProfileDetailsSuccess({required this.profileModel});
}
final class ProfileDetailsFailure extends ProfileDetailsState {
  final String errorMessage;
  ProfileDetailsFailure({required this.errorMessage});
}
