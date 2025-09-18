import 'package:dartz/dartz.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, List<ProductModel>>> getFavorite();

  Future<Either<Failure, String>> addToFavorite({required String productId});
  Future<Either<Failure, String>> deleteFromFavorite({required String productId});

}