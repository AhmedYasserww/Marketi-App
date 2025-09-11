
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/core/network/api_service.dart';
import 'package:marketi_app/features/home/data/models/filter_product_model/filter_product_model.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';
import 'package:marketi_app/features/home/data/repos/product_filter/product_filter_repo.dart';

class GetFilteredProductsRepoImp implements GetFilteredProductsRepo {
final ApiService apiService;
  GetFilteredProductsRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<ProductModel> >> fetchFilteredProducts(FilterProductsRequest request) async {
      try {
        final response = await apiService.post(
          endPoint: "home/productsFilter",
          data: request.toJson(),
        );

        log("Returned data: $response");

        List<ProductModel> productList = [];
        if (response['list'] != null) {
          for (var i in response['list']) {
            productList.add(ProductModel.fromJson(i));
          }
          return Right(productList);
        } else {
          return Left(ServerFailure(errorMessage: "Currently, no products are available here"));
        }
      } on DioException catch (e) {
        log("Dio Error: ${e.message}");
        final errorMessage = e.response?.data["message"] ?? "filter failed";
        return Left(ServerFailure(errorMessage: errorMessage));
      } catch (e) {
        return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
      }
  }
}