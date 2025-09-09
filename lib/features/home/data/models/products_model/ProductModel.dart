import 'package:marketi_app/features/home/data/models/products_model/Dimensions.dart';
import 'package:marketi_app/features/home/data/models/products_model/Meta.dart';
import 'package:marketi_app/features/home/data/models/products_model/Reviews.dart';

class ProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  double? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];

    price = _safeToDouble(json['price']);
    discountPercentage = _safeToDouble(json['discountPercentage']);
    rating = _safeToDouble(json['rating']);

    stock = _safeToInt(json['stock']);
    tags = json['tags'] != null ? List<String>.from(json['tags']) : [];
    brand = json['brand'];
    sku = json['sku'];
    weight = _safeToDouble(json['weight']);
    dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];

    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }

    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = _safeToInt(json['minimumOrderQuantity']);
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    images = json['images'] != null ? List<String>.from(json['images']) : [];
    thumbnail = json['thumbnail'];
  }


  double _safeToDouble(dynamic value) {
    try {
      if (value == null) return 0.0;
      if (value is int) return value.toDouble();
      if (value is double) return value;
      if (value is String) {
        return double.tryParse(value) ?? 0.0;
      }
      return 0.0;
    } catch (e) {

      return 0.0;
    }
  }


  int _safeToInt(dynamic value) {
    try {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) {
        return int.tryParse(value) ?? 0;
      }
      return 0;
    } catch (e) {

      return 0;
    }
  }
}
