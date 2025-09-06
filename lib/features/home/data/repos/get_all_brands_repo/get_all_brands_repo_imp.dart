import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/core/network/api_service.dart';
import 'package:marketi_app/features/home/data/models/brands_model/BrandModel.dart';
import 'package:marketi_app/features/home/data/repos/get_all_brands_repo/get_all_brands_repo.dart';

class GetAllBrandsRepoImp implements GetAllBrandsRepo {
  final ApiService apiService;

  GetAllBrandsRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<BrandModel>>> fetchAllBrands() async{
    try {
      final response = await apiService.get(
        endPoint: 'home/brands',
        token: ApiService.token,
      );

      log(" Raw API Response: $response");

      if (response is Map<String, dynamic> && response.containsKey('list')) {
        final List brandsJson = response['list'];

        final brands = brandsJson
            .map((item) => BrandModel.fromJson(item))
            .toList();

        log('✅ Fetched ${brands.length} products');
        return right(brands);
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