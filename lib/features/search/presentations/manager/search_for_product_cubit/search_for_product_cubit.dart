import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/search/data/repo/search_repo_imp.dart';
import 'package:meta/meta.dart';

part 'search_for_product_state.dart';

class SearchForProductCubit extends Cubit<SearchForProductState> {
  final SearchRepoImp searchRepoImpl;
  Timer? _debounce;

  SearchForProductCubit(this.searchRepoImpl)
      : super(SearchForProductInitial());

  void searchForProduct(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        emit(SearchForProductInitial());
        return;
      }

      emit(SearchForProductLoading());
      final result = await searchRepoImpl.searchForProduct(product: query);

      result.fold(
            (failure) => emit(SearchForProductFailure(errorMessage: failure.errorMessage)),
            (productList) => emit(SearchForProductSuccess(product: productList)),
      );
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
