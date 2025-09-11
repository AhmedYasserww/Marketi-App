part of 'get_all_product_by_single_category_cubit.dart';

@immutable
sealed class GetAllProductBySingleCategoryState {}

final class GetAllProductBySingleCategoryInitial extends GetAllProductBySingleCategoryState {}

final class GetAllProductBySingleCategoryLoading extends GetAllProductBySingleCategoryState {}

final class GetAllProductBySingleCategorySuccess extends GetAllProductBySingleCategoryState {
  final List<ProductModel> products;

  GetAllProductBySingleCategorySuccess({required this.products});
}

final class GetAllProductBySingleCategoryFailure extends GetAllProductBySingleCategoryState {
  final String errorMessage;

  GetAllProductBySingleCategoryFailure({required this.errorMessage});
}