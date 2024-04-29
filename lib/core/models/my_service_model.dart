class MyServiceModel {
  double? lng;
  String? price;
  String? serviceName;
  String? description;
  String? email;
  double? lat;
  String? status;
  String? cat;
  bool? unit;
  String? id;
  String? image;
  MyServiceModel(
      {this.lng,
      this.image,
      this.price,
      this.serviceName,
      this.description,
      this.email,
      this.id,
      this.lat,
      this.status,
      this.cat,
      this.unit});

  MyServiceModel.fromJson(Map<String, dynamic> json) {
    lng = json['lng'];
    image = json['image'];
    cat = json['cat'];
    id = json['id'];
    price = json['price'];
    serviceName = json['service_name'];
    description = json['description'];
    email = json['email'];
    lat = json['lat'];
    status = json['status'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lng'] = this.lng;
    data['id'] = this.id;
    data['cat'] = this.cat;
    data['image'] = this.image;
    data['price'] = this.price;
    data['service_name'] = this.serviceName;
    data['description'] = this.description;
    data['email'] = this.email;
    data['lat'] = this.lat;
    data['status'] = this.status;
    data['unit'] = this.unit;
    return data;
  }
}
