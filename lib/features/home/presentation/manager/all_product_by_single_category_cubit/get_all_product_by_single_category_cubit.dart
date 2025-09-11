import 'package:bloc/bloc.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/data/repos/get_all_products_by_single_category_repo/get_all_product_by_single_category_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_product_by_single_category_state.dart';

class GetAllProductBySingleCategoryCubit extends Cubit<GetAllProductBySingleCategoryState> {
  GetAllProductBySingleCategoryCubit(this.getAllProductRepo) : super(GetAllProductBySingleCategoryInitial());
  final GetAllProductBySingleCategoryRepo getAllProductRepo;

  Future<void> fetchAllProductsBySingleCategory({required String category}) async {
    emit(GetAllProductBySingleCategoryLoading());
    try {
      final result = await getAllProductRepo.fetchAllProductsBySingleCategory(category);
      result.fold(
            (failure) => emit(GetAllProductBySingleCategoryFailure(errorMessage: failure.errorMessage)),
            (products) => emit(GetAllProductBySingleCategorySuccess(products: products)),
      );
    } catch (e) {
      emit(GetAllProductBySingleCategoryFailure(errorMessage: e.toString()));
    }
  }
}
