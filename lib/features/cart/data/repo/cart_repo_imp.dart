import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/core/network/api_service.dart';
import 'package:marketi_app/features/cart/data/repo/cart_repo.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

class CartRepoImp implements CartRepo {
  final ApiService apiService;
  CartRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<ProductModel>>> getCart() async {

    try {
      final response = await apiService.get(
        endPoint: 'user/getCart',
      );

      log("📦 Raw API Response Cart Repo: $response");

      if (response is Map<String, dynamic> && response.containsKey('list')) {

        final List outerList = response['list'] ?? [];

        final List cartJson = outerList.expand((outerItem) {
          if (outerItem is Map<String, dynamic> &&
              outerItem.containsKey('list')) {
            return outerItem['list'];
          }
          return [];
        }).toList();


        final cartItems =
        cartJson.map((item) => ProductModel.fromJson(item)).toList();

        log('✅ Fetched ${cartItems.length} products from cart');
        return right(cartItems);
      } else {
        log('⚠️ Unexpected API response format: $response');
        return left(ServerFailure(
            errorMessage: "Unexpected API response format for cart"));
      }
    } on DioException catch (e) {
      log('❌ DioException: ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addToCart({required String productId}) async {
    try {
      final response = await apiService.post(
        endPoint: 'user/addCart',
        data: {"productId": productId},
      );

      log("🛒 Raw API Response AddToCart: $response");

      if (response is Map<String, dynamic> && response.containsKey('message')) {
        return right(response['message']);
      } else {
        return left(ServerFailure(errorMessage: "Unexpected API response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (AddToCart): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (AddToCart): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }


  @override
  Future<Either<Failure, List<ProductModel>>> deleteFromCart({required String productId}) {
    // TODO: implement deleteFromCart
    throw UnimplementedError();
  }


}