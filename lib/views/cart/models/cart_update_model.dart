class CartUpdateModel {
  bool status;
  String message;
  Data data;

  CartUpdateModel({this.status, this.message, this.data});

  CartUpdateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  Cart cart;
  double subTotal;
  double total;

  Data({this.cart, this.subTotal, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    subTotal = json['sub_total'] + 0.0;
    total = json['total'] + 0.0;
  }
}

class Cart {
  int id;
  int quantity;
  Product product;

  Cart({this.id, this.quantity, this.product});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  int id;
  double price;
  double oldPrice;
  int discount;
  String image;

  Product({this.id, this.price, this.oldPrice, this.discount, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'] + 0.0;
    oldPrice = json['old_price'] + 0.0;
    discount = json['discount'];
    image = json['image'];
  }

}