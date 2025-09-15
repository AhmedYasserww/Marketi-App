part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartSuccess extends AddToCartState {
  final String message;
  AddToCartSuccess({required this.message});

}
final class AddToCartFailure extends AddToCartState {
  final String errorMessage;
  AddToCartFailure({required this.errorMessage});
}
