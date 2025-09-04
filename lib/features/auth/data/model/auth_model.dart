class AuthModel {
  final bool status;
  final int statusCode;
  final String message;
  final String token;
  final String name;

  AuthModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.token,
    required this.name,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      status: json['status'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
