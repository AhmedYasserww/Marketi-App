import 'package:bloc/bloc.dart';
import 'package:marketi_app/features/home/data/models/brands_model/BrandModel.dart';
import 'package:marketi_app/features/home/data/repos/get_all_brands_repo/get_all_brands_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_brands_state.dart';

class GetAllBrandsCubit extends Cubit<GetAllBrandsState> {
  GetAllBrandsCubit(this.getAllBrandsRepo) : super(GetAllBrandsInitial());
  final GetAllBrandsRepo getAllBrandsRepo ;
  Future<void> fetchAllBrands()async{
    emit(GetAllBrandsLoading());
    try {
      final result = await getAllBrandsRepo.fetchAllBrands();
      result.fold(
            (failure) => emit(GetAllBrandsFailure(errorMessage: failure.errorMessage)),
            (brands) => emit(GetAllBrandsSuccess(brands: brands)),
      );
    }  catch (e) {
     emit(GetAllBrandsFailure(errorMessage: e.toString()));
    }
  }
}
