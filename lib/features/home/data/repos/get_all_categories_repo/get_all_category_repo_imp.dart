import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/core/network/api_service.dart';
import 'package:marketi_app/features/home/data/models/categories_model/CategoryModel.dart';
import 'package:marketi_app/features/home/data/repos/get_all_categories_repo/get_all_category_repo.dart';

class GetAllCategoryRepoImp implements GetAllCategoryRepo {
  final ApiService apiService;

  GetAllCategoryRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<CategoryModel>>> fetchAllCategories() async{
    try {
      final response = await apiService.get(
        endPoint: 'home/categories',

      );

    //  log("📦 Raw API Response: $response");

      if (response is Map<String, dynamic> && response.containsKey('list')) {
        final List categoriesJson = response['list'];

        final categories = categoriesJson
            .map((item) => CategoryModel.fromJson(item))
            .toList();

        log('✅ Fetched ${categories.length} categories');
        return right(categories);
      } else {
        log('⚠️ Unexpected API response format: $response');
        return left(ServerFailure(errorMessage: "Unexpected API response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException: ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  }

