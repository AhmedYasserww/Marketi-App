import 'package:dartz/dartz.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

abstract class GetAllProductRepo{
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts();
}