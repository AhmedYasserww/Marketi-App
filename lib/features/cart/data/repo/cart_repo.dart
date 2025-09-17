import 'package:dartz/dartz.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

abstract class CartRepo {
  Future<Either<Failure, List<ProductModel>>> getCart();

  Future<Either<Failure, String>> addToCart({required String productId});
  Future<Either<Failure, String>> deleteFromCart({required String productId});

}