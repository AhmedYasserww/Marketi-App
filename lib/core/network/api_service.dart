import 'package:dio/dio.dart';
import 'package:marketi_app/core/local_data/save_user_date.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});

  final String baseUrl = "https://supermarket-dan1.onrender.com/api/v1/";

  Future<dynamic> get({
    required String endPoint,
  }) async {
    try {
      final token = await AppPreferences.getToken();

      final response = await dio.get(
        "$baseUrl$endPoint",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(
        "GET request failed: ${e.response?.statusCode} - ${e.response?.data}",
      );
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final token = await AppPreferences.getToken();

      var response = await dio.post(
        "$baseUrl$endPoint",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response?.data;
      } else {
        throw Exception("Network error: ${e.message}");
      }
    }
  }
  Future<dynamic> delete({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final token = await AppPreferences.getToken();

      final response = await dio.delete(
        "$baseUrl$endPoint",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response?.data;
      } else {
        throw Exception("Network error: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
