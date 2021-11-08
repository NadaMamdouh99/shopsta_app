class AddressModel {
  bool status;
  Null message;
  Data data;

  AddressModel({this.status, this.message, this.data});

  AddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int currentPage;
  List<AddressData> addressData;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  Data(
      {this.currentPage,
        this.addressData,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      addressData = new List<AddressData>();
      json['data'].forEach((v) {
        addressData.add(new AddressData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class AddressData {
  int id;
  String name;
  String city;
  String region;
  String details;
  String notes;
  double latitude;
  double longitude;

  AddressData(
      {this.id,
        this.name,
        this.city,
        this.region,
        this.details,
        this.notes,
        this.latitude,
        this.longitude});

  AddressData.fromJson(Map<String, dynamic> json) {
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


// class AddressModel {
//   bool status;
//   String message;
//   Data data;
//
//   AddressModel({this.status, this.message, this.data});
//
//   AddressModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
// }
//
// class Data {
//   String name;
//   String city;
//   String region;
//   String details;
//   double latitude;
//   double longitude;
//   String notes;
//   int id;
//
//   Data(
//       {this.name,
//         this.city,
//         this.region,
//         this.details,
//         this.latitude,
//         this.longitude,
//         this.notes,
//         this.id});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     city = json['city'];
//     region = json['region'];
//     details = json['details'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     notes = json['notes'];
//     id = json['id'];
//   }
// }