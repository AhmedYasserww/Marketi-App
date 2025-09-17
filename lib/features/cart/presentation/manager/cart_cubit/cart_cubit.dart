import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/cart/data/repo/cart_repo.dart';
import 'package:marketi_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';


class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo) : super(CartState(cartItems: []));

  Future<void> getCart() async {
    emit(state.copyWith(isLoading: true));
    final result = await cartRepo.getCart();
    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.errorMessage)),
          (products) => emit(CartState(cartItems: products)),
    );
  }

  Future<void> deleteFromCart(String productId) async {
    emit(state.copyWith(isLoading: true));
    final result = await cartRepo.deleteFromCart(productId: productId);
    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.errorMessage)),
          (_) async {
        await getCart();
      },
    );
  }


  Future<void> updateQuantity(ProductModel product, int quantity) async {
    if (quantity <= 0) {

      await deleteFromCart(product.id.toString());
      return;
    }


    final updatedProducts = state.cartItems.map((p) {
      if (p.id == product.id) {
        return p.copyWith(quantity: quantity);
      }
      return p;
    }).toList();

    emit(state.copyWith(cartItems: updatedProducts));
  }
  bool isInCart(String productId) {
    return state.cartItems.any((item) => item.id.toString() == productId);
  }


}
