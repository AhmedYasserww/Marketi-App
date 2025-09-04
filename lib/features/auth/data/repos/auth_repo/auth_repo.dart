import 'package:dartz/dartz.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/features/auth/data/model/auth_model.dart';


abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
  });

  Future<Either<Failure, AuthModel>> signIn({
    required String email,
    required String password,
  });
}
