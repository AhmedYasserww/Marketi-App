import 'package:bloc/bloc.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/data/repos/get_all_products_repo/get_all_product_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  GetAllProductCubit(this.getAllProductRepo) : super(GetAllProductInitial());


  final GetAllProductRepo getAllProductRepo;

  Future<void> fetchAllProducts() async {
    emit(GetAllProductLoading());
    try {
      final result = await getAllProductRepo.fetchAllProducts();
      result.fold(
            (failure) => emit(GetAllProductFailure(errorMessage: failure.errorMessage)),
            (products) => emit(GetAllProductSuccess(products: products)),
      );
    } catch (e) {
      emit(GetAllProductFailure(errorMessage: e.toString()));
    }
  }
}
