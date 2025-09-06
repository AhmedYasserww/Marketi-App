import 'package:dartz/dartz.dart';
import 'package:marketi_app/features/home/data/models/brands_model/BrandModel.dart';
import '../../../../../core/errors/faluire.dart';

abstract class GetAllBrandsRepo{
  Future<Either<Failure, List<BrandModel>>> fetchAllBrands();
}