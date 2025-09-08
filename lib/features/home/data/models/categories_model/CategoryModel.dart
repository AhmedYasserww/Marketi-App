class CategoryModel {
  CategoryModel({
      this.slug, 
      this.name, 
      this.url, 
      this.image,});

  CategoryModel.fromJson(dynamic json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
    image = json['image'];
  }
  String? slug;
  String? name;
  String? url;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slug'] = slug;
    map['name'] = name;
    map['url'] = url;
    map['image'] = image;
    return map;
  }

}