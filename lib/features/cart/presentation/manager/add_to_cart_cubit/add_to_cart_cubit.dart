import 'package:bloc/bloc.dart';
import 'package:marketi_app/features/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final CartRepo cartRepo;

  AddToCartCubit(this.cartRepo) : super(AddToCartInitial());

  Future<void> addToCart({required String productId}) async {
    emit(AddToCartLoading());
    final result = await cartRepo.addToCart(productId: productId);

    result.fold(
          (failure) => emit(AddToCartFailure(errorMessage: failure.errorMessage)),
          (message) => emit(AddToCartSuccess(message: message)),
    );
  }
}
