// import 'package:bloc/bloc.dart';
// import 'package:marketi_app/features/favorite/data/repos/favorite_repo.dart';
// import 'package:meta/meta.dart';
//
// part 'add_to_favorite_state.dart';
//
// class AddToFavoriteCubit extends Cubit<AddToFavoriteState> {
//   AddToFavoriteCubit(this.favoriteRepo) : super(AddToFavoriteInitial());
//   final FavoriteRepo favoriteRepo;
//
//   Future<void> addToFavorite({required String productId}) async {
//     emit(AddToFavoriteLoading());
//     final result = await favoriteRepo.addToFavorite(productId: productId);
//
//     result.fold(
//           (failure) => emit(AddToFavoriteFailure(errorMessage: failure.errorMessage)),
//           (message) => emit(AddToFavoriteSuccess(message: message)),
//     );
//   }
// }
