import 'Location.dart';

class Location {
  Location({
      this.location, 
      this.name,});

  Location.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    name = json['name'];
  }
  Location? location;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['name'] = name;
    return map;
  }

}