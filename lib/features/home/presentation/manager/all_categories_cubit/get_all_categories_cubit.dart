import 'package:bloc/bloc.dart';
import 'package:marketi_app/features/home/data/models/categories_model/CategoryModel.dart';
import 'package:marketi_app/features/home/data/repos/get_all_categories_repo/get_all_category_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit(this.getAllCategoryRepo) : super(GetAllCategoriesInitial());
  final GetAllCategoryRepo getAllCategoryRepo;

  Future<void> fetchAllCategories() async {
    emit(GetAllCategoriesLoading());
    try {
      final result = await getAllCategoryRepo.fetchAllCategories();
      result.fold(
            (failure) => emit(GetAllCategoriesFailure(errorMessage: failure.errorMessage)),
            (categories) => emit(GetAllCategoriesSuccess(categories: categories)),
      );
    } catch (e) {
      emit(GetAllCategoriesFailure(errorMessage: e.toString()));
    }
  }
}
