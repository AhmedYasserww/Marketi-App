import 'package:dio/dio.dart';

class ApiService {
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3OWNhZTQyYjNiMWEzMWY0ZTA2MTdjYyIsImlhdCI6MTc1NzEwOTc1Mn0.kQ2eVikQp6tbgKo8bWxEG1-U65RJum4Ov-zQYq8jJ5c";

  final Dio dio;
  ApiService({required this.dio});

  final String baseUrl = "https://marketi-app.onrender.com/api/v1/";

  Future<dynamic> get({
    required String endPoint,
    String? token,
  }) async {
    try {
      final response = await dio.get(
        "$baseUrl$endPoint",
        options: Options(
          headers: {
            "Authorization": "Bearer ${token ?? ApiService.token}",
            "Accept": "application/json",
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(
          "GET request failed: ${e.response?.statusCode} - ${e.response?.data}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      var response = await dio.post(
        "$baseUrl$endPoint",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
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
}
