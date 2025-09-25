class Message {
  Message({
      this.id, 
      this.name, 
      this.phone, 
      this.email, 
      this.address, 
      this.image,});

  Message.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? image;
  String get fullImageUrl {
    if (image == null || image!.isEmpty) {
      return "";
    }
    return "https://supermarket-dan1.onrender.com/api/v1/$image";
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['address'] = address;
    map['image'] = image;
    return map;
  }

}