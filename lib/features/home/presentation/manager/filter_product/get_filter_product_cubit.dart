import 'package:bloc/bloc.dart';
import 'package:marketi_app/features/home/data/models/filter_product_model/filter_product_model.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/data/repos/product_filter/product_filter_repo.dart';
import 'package:meta/meta.dart';

part 'get_filter_product_state.dart';

class GetFilterProductCubit extends Cubit<GetFilterProductState> {
  GetFilterProductCubit(this.getFilteredProductsRepo) : super(GetFilterProductInitial());
  final GetFilteredProductsRepo getFilteredProductsRepo;

  Future<void> fetchFilteredProducts(FilterProductsRequest request) async {
    emit(GetFilterProductLoading());
    final filteredProducts = await getFilteredProductsRepo.fetchFilteredProducts(request);
    filteredProducts.fold((l) => emit(
        GetFilterProductFailure(errorMessage: l.errorMessage)),
            (filterProduct) => emit(GetFilterProductSuccess(filterProductsList: filterProduct)));
  }
}
