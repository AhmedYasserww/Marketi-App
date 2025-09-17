import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

class CartState {
  final List<ProductModel> cartItems;
  final bool isLoading;
  final String? errorMessage;

  CartState({
    required this.cartItems,
    this.isLoading = false,
    this.errorMessage,
  });

  CartState copyWith({
    List<ProductModel>? cartItems,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

}
