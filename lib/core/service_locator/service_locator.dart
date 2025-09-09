

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi_app/features/auth/data/repos/auth_repo/auth_repo_imp.dart';
import 'package:marketi_app/features/home/data/repos/get_all_brands_repo/get_all_brands_repo_imp.dart';
import 'package:marketi_app/features/home/data/repos/get_all_categories_repo/get_all_category_repo_imp.dart';
import 'package:marketi_app/features/home/data/repos/get_all_products_repo/get_all_product_repo_imp.dart';
import 'package:marketi_app/features/search/data/repo/search_repo_imp.dart';
import 'package:marketi_app/features/search/presentations/manager/search_for_product_cubit/search_for_product_cubit.dart';

import '../network/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiService:getIt.get<ApiService>(),));
  getIt.registerSingleton<GetAllProductRepoImp>(GetAllProductRepoImp(apiService:getIt.get<ApiService>(),));
  getIt.registerSingleton<GetAllCategoryRepoImp>(GetAllCategoryRepoImp(apiService:getIt.get<ApiService>(),));
  getIt.registerSingleton<GetAllBrandsRepoImp>(GetAllBrandsRepoImp(apiService:getIt.get<ApiService>(),));
  getIt.registerSingleton<SearchRepoImp>(
    SearchRepoImp(apiService: getIt.get<ApiService>()),
  );
  getIt.registerFactory<SearchForProductCubit>(() => SearchForProductCubit(
      getIt<SearchRepoImp>(),
      ));
  // getIt.registerSingleton<AllMaterialRepoImp>(AllMaterialRepoImp(apiService:getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<AllCoursesRepoImp>(AllCoursesRepoImp(apiService:getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<AllPostsRepoImp>(AllPostsRepoImp(apiService:getIt.get<ApiService>(),
  // ));
  // getIt.registerSingleton<AllPendingUsersRepoImp>(AllPendingUsersRepoImp(apiService:getIt.get<ApiService>(),
  // ));
  //
  // getIt.registerSingleton<AddPostRepo>(AddPostRepoImpl(apiService:getIt.get<ApiService>(),
  // ));
  //
  // getIt.registerSingleton<AddMaterialRepo>(AddMaterialRepoImpl(apiService:getIt.get<ApiService>(),
  // ));

}

