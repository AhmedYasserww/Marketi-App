class BrandModel {
  BrandModel({
      this.name, 
      this.emoji,});

  BrandModel.fromJson(dynamic json) {
    name = json['name'];
    emoji = json['emoji'];
  }
  String? name;
  String? emoji;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['emoji'] = emoji;
    return map;
  }

}