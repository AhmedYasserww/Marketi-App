import 'Location.dart';

class ProductModel {
  ProductModel({
    this.location,
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.rating,
    this.discount,
    this.remain,
    this.sold,
    this.category,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ProductModel.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    id = json['_id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];

    // ✅ إصلاح روابط الصور هنا
    if (json['images'] != null) {
      images = List<String>.from(
        json['images'].map((img) {
          final fixedUrl = img.toString().replaceAll('\\', '/');
          if (fixedUrl.startsWith('http')) {
            return fixedUrl; // الصورة كاملة وتمام ✅
          } else {
            return 'https://marketi-app.onrender.com/$fixedUrl'; // لو رجع مسار نسبي نضيف الـ domain
          }
        }),
      );
    } else {
      images = [];
    }
    rating = (json['rating'] != null) ? double.tryParse(json['rating'].toString()) : 0.0;
    discount = json['discount'];
    remain = json['remain'];
    sold = json['sold'];
    category = json['category'];
    brand = json['brand'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Location? location;
  String? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  double? rating;
  int? discount;
  int? remain;
  int? sold;
  String? category;
  String? brand;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['_id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    map['images'] = images;
    map['rating'] = rating;
    map['discount'] = discount;
    map['remain'] = remain;
    map['sold'] = sold;
    map['category'] = category;
    map['brand'] = brand;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
