import 'Message.dart';

class ProfileModel {
  ProfileModel({
      this.message,});

  ProfileModel.fromJson(dynamic json) {
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
  }
  Message? message;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) {
      map['message'] = message?.toJson();
    }
    return map;
  }

}
extension ProfileImageExtension on Message {
  String get fullImageUrl =>
      image != null && image!.isNotEmpty
          ? "https://supermarket-dan1.onrender.com/api/v1/$image"
          : "";
}