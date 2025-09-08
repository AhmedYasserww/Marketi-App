import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/core/network/api_service.dart';
import 'package:marketi_app/features/auth/data/model/auth_model.dart';
import 'package:marketi_app/features/auth/data/repos/auth_repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, AuthModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: "auth/signIn",
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response["token"] != null &&
          (response["message"] == "login successfully" || response["message"] == "Login successfully")) {

        return Right(AuthModel.fromJson(response));
      } else {
        final errorMessage = response["message"] ?? "Invalid email or password";
        return Left(ServerFailure(errorMessage: errorMessage));
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data["message"] ?? "Login failed";
      return Left(ServerFailure(errorMessage: errorMessage));
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }
  @override
  Future<Either<Failure, AuthModel>> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String confirmPassword,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: "auth/signUp",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
          "confirmPassword": confirmPassword,
        },
      );


      if  (
      (response["message"] == "user created and verification email send successfully" )){
        return Right(AuthModel.fromJson(response));
      } else {
        final errorMessage = response['message'] ?? "Register failed";
        return Left(ServerFailure(errorMessage: errorMessage));
      }
    } on DioException catch (e) {

      if (e.response?.statusCode == 200 || e.response?.statusCode == 201) {
        return Right(AuthModel.fromJson(e.response?.data));
      }


      final errorMessage = e.response?.data["message"] ?? "Register failed";
      return Left(ServerFailure(errorMessage: errorMessage));
    } catch (e) {
      return Left(ServerFailure(errorMessage: "Unexpected error: $e"));
    }
  }



}
