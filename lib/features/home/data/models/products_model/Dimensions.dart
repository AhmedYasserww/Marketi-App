class Dimensions {
  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  Dimensions.fromJson(dynamic json) {
    width = _safeToDouble(json['width']);
    height = _safeToDouble(json['height']);
    depth = _safeToDouble(json['depth']);
  }

  double? width;
  double? height;
  double? depth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    return map;
  }

  double _safeToDouble(dynamic value) {
    try {
      if (value == null) return 0.0;
      if (value is int) return value.toDouble();
      if (value is double) return value;
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    } catch (e) {
      print("⚠️ Can't parse double value: $value");
      return 0.0;
    }
  }
}
