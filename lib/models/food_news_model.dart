class FoodNews {
  int? error;
  int? status;
  List<Data>? data;
  String? message;

  FoodNews({this.error, this.status, this.data, this.message});

  FoodNews.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? thumbnail;
  String? decscription;
  String? thumbnailone;
  String? decscriptionone;
  String? thumbnailtwo;
  String? decscriptiontwo;
  String? thumbnailthree;
  String? decscriptionthree;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.thumbnail,
        this.decscription,
        this.thumbnailone,
        this.decscriptionone,
        this.thumbnailtwo,
        this.decscriptiontwo,
        this.thumbnailthree,
        this.decscriptionthree,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    decscription = json['decscription'];
    thumbnailone = json['thumbnailone'];
    decscriptionone = json['decscriptionone'];
    thumbnailtwo = json['thumbnailtwo'];
    decscriptiontwo = json['decscriptiontwo'];
    thumbnailthree = json['thumbnailthree'];
    decscriptionthree = json['decscriptionthree'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['decscription'] = this.decscription;
    data['thumbnailone'] = this.thumbnailone;
    data['decscriptionone'] = this.decscriptionone;
    data['thumbnailtwo'] = this.thumbnailtwo;
    data['decscriptiontwo'] = this.decscriptiontwo;
    data['thumbnailthree'] = this.thumbnailthree;
    data['decscriptionthree'] = this.decscriptionthree;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}