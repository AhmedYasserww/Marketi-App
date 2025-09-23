
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/features/favorite/data/repos/favorite_repo.dart';
import 'package:marketi_app/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit(this.favoriteRepo) : super(const FavoriteState());

  Future<void> getFavorite() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await favoriteRepo.getFavorite();
    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.errorMessage)),
          (favorites) => emit(state.copyWith(isLoading: false, favoriteItems: favorites)),
    );
  }

  Future<void> addToFavorite(String productId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, successMessage: null));

    final result = await favoriteRepo.addToFavorite(productId: productId);
    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.errorMessage)),
          (message) async {
        // هنا نستدعي getFavorite بدون ما يرن emit للـ loading
        final favoritesResult = await favoriteRepo.getFavorite();
        favoritesResult.fold(
              (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.errorMessage)),
              (favorites) => emit(state.copyWith(
            isLoading: false,
            favoriteItems: favorites,
            successMessage: message,
          )),
        );
      },
    );
  }




  Future<void> deleteFromFavorite(String productId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, successMessage: null));
    final result = await favoriteRepo.deleteFromFavorite(productId: productId);
    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.errorMessage)),
          (message) {
            final updatedList = state.favoriteItems
                .where((item) => item.id.toString() != productId)
                .toList();
        emit(state.copyWith(
          isLoading: false,
          favoriteItems: updatedList,
          successMessage: message,
        ));
      },
    );
  }

  bool isInFavorite(String productId) {
    return state.favoriteItems.any((item) => item.id.toString() == productId);
  }
}

