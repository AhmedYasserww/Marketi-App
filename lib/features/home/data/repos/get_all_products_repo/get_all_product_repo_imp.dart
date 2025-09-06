import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/core/network/api_service.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/data/repos/get_all_products_repo/get_all_product_repo.dart';

class GetAllProductRepoImp implements GetAllProductRepo {
  final ApiService apiService;

  GetAllProductRepoImp({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts() async {
    try {
      final response = await apiService.get(
        endPoint: 'home/products',
        token: ApiService.token,
      );

     log("📦 Raw API Response: $response");

      if (response is Map<String, dynamic> && response.containsKey('list')) {
        final List productsJson = response['list'];

        final products = productsJson
            .map((item) => ProductModel.fromJson(item))
            .toList();

        log('✅ Fetched ${products.length} products');
        return right(products);
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
