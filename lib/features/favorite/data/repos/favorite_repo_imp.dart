import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/core/network/api_service.dart';
import 'package:marketi_app/features/favorite/data/repos/favorite_repo.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

class FavoriteRepoImp implements FavoriteRepo {
  final ApiService apiService;
  FavoriteRepoImp({required this.apiService});

@override
  Future<Either<Failure, List<ProductModel>>> getFavorite() async {
    try {
      final response = await apiService.get(
        endPoint: 'user/getFavorite',
      );

      log("📦 Raw API Response Cart Repo get Favorite: $response");

      if (response is Map<String, dynamic>) {
        final outerList = response['list'];

        if (outerList is List) {

          final favoriteItems = outerList
              .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
              .toList();

          log('✅ Fetched ${favoriteItems.length} favorite products from Favorites');
          return right(favoriteItems);
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
  Future<Either<Failure, String>> addToFavorite({required String productId}) async {
    try {
      final response = await apiService.post(
        endPoint: 'user/addFavorite',
        data: {"productId": productId},
      );

      log("🛒 Raw API Response AddToFavorite: $response");

      if (response is Map<String, dynamic> && response['message'] is String) {
        return right(response['message']);
      } else {
        log("⚠️ Unexpected API response format: $response");
        return left(ServerFailure(errorMessage: "Unexpected API response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (AddToFavorite): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (AddToFavorite): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }


  @override
  Future<Either<Failure, String>> deleteFromFavorite({required String productId}) async {
    try {
      final response = await apiService.delete(
        endPoint: 'user/deleteFavorite',
        data: {"productId": productId},
      );

      log("🗑️ Raw API Response delete from Favorite: $response");

      if (response is Map<String, dynamic> && response['message'] is String) {
        return right(response['message']);
      } else {
        log("⚠️ Unexpected API response format: $response");
        return left(ServerFailure(errorMessage: "Unexpected API response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (DeleteFromFavorite): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (DeleteFromFavorite): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }



}