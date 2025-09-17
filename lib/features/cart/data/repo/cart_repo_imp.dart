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
  @override
  Future<Either<Failure, List<ProductModel>>> getCart() async {
    try {
      final response = await apiService.get(
        endPoint: 'user/getCart',
      );

      log("📦 Raw API Response Cart Repo: $response");

      if (response is Map<String, dynamic>) {
        final outerList = response['list'];

        if (outerList is List) {
          // كل عنصر في الـ list هو منتج
          final cartItems = outerList
              .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
              .toList();

          log('✅ Fetched ${cartItems.length} products from cart');
          return right(cartItems);
        } else {
          log('⚠️ `list` is not a List in response: $outerList');
          return left(ServerFailure(errorMessage: "`list` is not a valid list"));
        }
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


  @override
  Future<Either<Failure, String>> addToCart({required String productId}) async {
    try {
      final response = await apiService.post(
        endPoint: 'user/addCart',
        data: {"productId": productId},
      );

      log("🛒 Raw API Response AddToCart: $response");

      if (response is Map<String, dynamic> && response['message'] is String) {
        return right(response['message']);
      } else {
        log("⚠️ Unexpected API response format: $response");
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