// import 'package:bloc/bloc.dart';
// import 'package:marketi_app/features/cart/data/repo/cart_repo.dart';
// import 'package:meta/meta.dart';
//
// part 'delete_from_cart_state.dart';
//
// class DeleteFromCartCubit extends Cubit<DeleteFromCartState> {
//   DeleteFromCartCubit(this.cartRepo) : super(DeleteFromCartInitial());
//   final CartRepo cartRepo ;
//   Future<void> deleteFromCart({required String productId}) async {
//     emit(DeleteFromCartLoading());
//     final result = await cartRepo.deleteFromCart(productId: productId);
//
//     result.fold(
//           (failure) => emit(DeleteFromCartFailure(errorMessage: failure.errorMessage)),
//           (message) => emit(DeleteFromCartSuccess(message: message)),
//     );
//   }
// }
