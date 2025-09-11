import 'package:dartz/dartz.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/features/home/data/models/filter_product_model/filter_product_model.dart';
import 'package:marketi_app/features/home/data/models/products_model/ProductModel.dart';

abstract class GetFilteredProductsRepo {
  Future<Either<Failure, List<ProductModel> >> fetchFilteredProducts(FilterProductsRequest request);
}