class AuthModel {
  final String message;
  final String token;
  final UserModel user;

  AuthModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      user: UserModel.fromJson(json['user'] ?? {}),
    );
  }
}

class UserModel {
  final String name;
  final String phone;
  final String email;
  final String role;
  final String image;

  UserModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'role': role,
      'image': image,
    };
  }
}
