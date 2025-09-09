import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import '../../../../core/network/api_service.dart';
import 'package:marketi_app/features/search/data/repo/search_repo.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;
  SearchRepoImp({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> searchForProduct({
    required String product,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: 'home/productsFilter',
        data: {
          "search": product,
          "limit": 30,
        },
      );

      log("Returned data: $response");

      List<ProductModel> productList = [];
      if (response['list'] != null) {
        for (var i in response['list']) {
          productList.add(ProductModel.fromJson(i));
        }
        return Right(productList);
      } else {
        return Left(ServerFailure(errorMessage: "No items found"));
      }
    } on DioException catch (e) {
      log("Dio Error: ${e.message}");
      final errorMessage = e.response?.data["message"] ?? "Search failed";
      return Left(ServerFailure(errorMessage: errorMessage));
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }
}
