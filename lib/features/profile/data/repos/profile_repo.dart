import 'package:dartz/dartz.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/features/profile/data/models/ProfileModel.dart';


abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getUserData();
  Future<Either<Failure, String>> uploadImage(String filePath);

}
