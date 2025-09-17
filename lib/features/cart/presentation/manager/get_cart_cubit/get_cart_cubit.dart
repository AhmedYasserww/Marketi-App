// import 'package:bloc/bloc.dart';
// import 'package:marketi_app/features/cart/data/repo/cart_repo.dart';
// import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
// import 'package:meta/meta.dart';
//
// part 'get_cart_state.dart';
//
// class GetCartCubit extends Cubit<GetCartState> {
//   GetCartCubit(this.cartRepo) : super(GetCartInitial());
//   final CartRepo cartRepo;
//   Future<void> getCart() async {
//     emit(GetCartLoading());
//     try {
//       final result = await cartRepo.getCart();
//       result.fold(
//             (failure) => emit(GetCartFailure(errorMessage: failure.errorMessage)),
//             (products) => emit(GetCartSuccess(cartProducts: products)),
//       );
//     } catch (e) {
//       emit(GetCartFailure(errorMessage: e.toString()));
//     }
//   }
// }
