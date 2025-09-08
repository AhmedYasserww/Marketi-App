import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:marketi_app/features/auth/data/model/auth_model.dart';

class AppPreferences {
  static Future<void> saveUserData(AuthModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode({
      "message": user.message,
      "token": user.token,
      "user": user.user.toJson(),
    }));
    await prefs.setString('token', user.token);
  }

  static Future<AuthModel?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('user');
    if (data != null) {
      return AuthModel.fromJson(jsonDecode(data));
    }
    return null;
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('token');
  }
}
