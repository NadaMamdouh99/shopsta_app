class BannersAndProductsModel {
  bool status;
  Null message;
  Data data;

  BannersAndProductsModel({this.status, this.message, this.data});

  BannersAndProductsModel.fromJson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.message = json['message'];
    this.data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Banners> banners;
  List<Products> products;
  String ad;

  Data({this.banners, this.products, this.ad});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    this.ad = json['ad'];
  }

}

class Banners {
  int id;
  String image;
  Null category;
  Null product;

  Banners({this.id, this.image, this.category, this.product});

  Banners.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.image = json['image'];
    this.category = json['category'];
    this.product = json['product'];
  }

}

class Products {
  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  Products(
      {this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description,
        this.images,
        this.inFavorites,
        this.inCart});

  Products.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.price=json['price']+ 0.0;
    this.oldPrice=json['old_price'] + 0.0;
    this.discount = json['discount'];
    this.image = json['image'];
    this.name = json['name'];
    this.description = json['description'];
    this.images = json['images'].cast<String>();
    this.inFavorites = json['in_favorites'];
    this.inCart = json['in_cart'];
  }
}