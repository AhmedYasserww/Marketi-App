part of 'get_filter_product_cubit.dart';

@immutable
sealed class GetFilterProductState {}

final class GetFilterProductInitial extends GetFilterProductState {}
final class GetFilterProductLoading extends GetFilterProductState {}
final class GetFilterProductSuccess extends GetFilterProductState {
  final List<ProductModel> filterProductsList;
  GetFilterProductSuccess({required this.filterProductsList});
}

final class GetFilterProductFailure extends GetFilterProductState {
  final String errorMessage;
  GetFilterProductFailure({required this.errorMessage});
}
