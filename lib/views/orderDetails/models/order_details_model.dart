class OrderDetailsModel {
  bool status;
  Null message;
  Data data;

  OrderDetailsModel({this.status, this.message, this.data});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int id;
  double cost;
  int discount;
  int points;
  double vat;
  double total;
  int pointsCommission;
  String promoCode;
  String paymentMethod;
  String date;
  String status;
  Address address;
  List<Products> products;

  Data(
      {this.id,
        this.cost,
        this.discount,
        this.points,
        this.vat,
        this.total,
        this.pointsCommission,
        this.promoCode,
        this.paymentMethod,
        this.date,
        this.status,
        this.address,
        this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cost = json['cost'] + 0.0;
    discount = json['discount'];
    points = json['points'];
    vat = json['vat'] + 0.0;
    total = json['total'] + 0.0;
    pointsCommission = json['points_commission'];
    promoCode = json['promo_code'];
    paymentMethod = json['payment_method'];
    date = json['date'];
    status = json['status'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }
}

class Address {
  int id;
  String name;
  String city;
  String region;
  String details;
  String notes;
  double latitude;
  double longitude;

  Address(
      {this.id,
        this.name,
        this.city,
        this.region,
        this.details,
        this.notes,
        this.latitude,
        this.longitude});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
    latitude = json['latitude'] + 0.0;
    longitude = json['longitude'] + 0.0;
  }
}

class Products {
  int id;
  int quantity;
  double price;
  String name;
  String image;

  Products({this.id, this.quantity, this.price, this.name, this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'] + 0.0;
    name = json['name'];
    image = json['image'];
  }
}
