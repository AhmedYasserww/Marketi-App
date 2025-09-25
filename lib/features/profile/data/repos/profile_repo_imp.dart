import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi_app/core/errors/faluire.dart';
import 'package:marketi_app/core/network/api_service.dart';
import 'package:marketi_app/features/profile/data/models/ProfileModel.dart';
import 'profile_repo.dart';

class ProfileRepoImp implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImp({required this.apiService});

  @override
  Future<Either<Failure, ProfileModel>> getUserData() async {
    try {
      final response = await apiService.get(
        endPoint: "portfoilo/userData",
      );

      log("📥 Raw Response: $response");

      if (response is Map<String, dynamic> && response.containsKey("message")) {
        final profile = ProfileModel.fromJson(response);
        return right(profile);
      } else {
        log("⚠️ Unexpected response format: $response");
        return left(ServerFailure(errorMessage: "Unexpected API response format"));
      }
    } on DioException catch (e) {
      log("❌ DioException: ${e.message}");
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log("❌ Unexpected Error: $e");
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
  @override
  Future<Either<Failure, String>> uploadImage(String filePath) async {
    try {
      final fileName = filePath.split('/').last;

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(filePath, filename: fileName), 
      });

      final response = await apiService.postMultipart(
        endPoint: 'portfoilo/addImage',
        data: formData,
      );

      log("📥 Raw Response upload: $response");

      if (response is Map && response["message"] != null) {
        return right(response["message"].toString());
      } else {
        return left(ServerFailure(errorMessage: "Unexpected API response format"));
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }


}
