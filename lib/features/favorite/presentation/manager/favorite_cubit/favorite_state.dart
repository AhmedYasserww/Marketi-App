import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

class FavoriteState {
  final List<ProductModel> favoriteItems;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;

  const FavoriteState({
    this.favoriteItems = const [],
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
  });

  FavoriteState copyWith({
    List<ProductModel>? favoriteItems,
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
  }) {
    return FavoriteState(
      favoriteItems: favoriteItems ?? this.favoriteItems,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}
