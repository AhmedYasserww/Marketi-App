part of 'get_all_brands_cubit.dart';

@immutable
sealed class GetAllBrandsState {}

final class GetAllBrandsInitial extends GetAllBrandsState {}

final class GetAllBrandsLoading extends GetAllBrandsState {}

final class GetAllBrandsSuccess extends GetAllBrandsState {
  final List<BrandModel> brands;

  GetAllBrandsSuccess({required this.brands});
}

final class GetAllBrandsFailure extends GetAllBrandsState {
  final String errorMessage;

  GetAllBrandsFailure({required this.errorMessage});

}