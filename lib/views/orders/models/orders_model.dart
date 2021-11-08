class OrdersModel {
  bool status;
  Null message;
  Data data;

  OrdersModel({this.status, this.message, this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int currentPage;
  List<OrderData> orderData;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  //Null nextPageUrl;
  String path;
  int perPage;
  //Null prevPageUrl;
  int to;
  int total;

  Data(
      {this.currentPage,
        this.orderData,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        //this.nextPageUrl,
        this.path,
        this.perPage,
        //this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      orderData = new List<OrderData>();
      json['data'].forEach((v) {
        orderData.add(new OrderData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    //nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    //prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class OrderData {
  int id;
  double total;
  String date;
  String status;

  OrderData({this.id, this.total, this.date, this.status});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'] + 0.0;
    date = json['date'];
    status = json['status'];
  }
}
