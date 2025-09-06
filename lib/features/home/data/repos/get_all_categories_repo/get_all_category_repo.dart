import 'package:dartz/dartz.dart';
import 'package:marketi_app/features/home/data/models/categories_model/CategoryModel.dart';

import '../../../../../core/errors/faluire.dart';

abstract class GetAllCategoryRepo{
  Future<Either<Failure, List<CategoryModel>>> fetchAllCategories();
}