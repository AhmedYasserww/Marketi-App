class BrandModel {
  BrandModel({
      this.id, 
      this.name, 
      this.imagePath, 
      this.v,});

  BrandModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    imagePath = json['imagePath'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? imagePath;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['imagePath'] = imagePath;
    map['__v'] = v;
    return map;
  }

}