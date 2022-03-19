class Meme {
  int? code;
  List<Data>? data;
  String? message;
  String? next;

  Meme({this.code, this.data, this.message, this.next});

  Meme.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['next'] = this.next;
    return data;
  }
}

class Data {
  int? iD;
  String? bottomText;
  String? image;
  String? name;
  int? rank;
  String? tags;
  String? topText;

  Data(
      {this.iD,
      this.bottomText,
      this.image,
      this.name,
      this.rank,
      this.tags,
      this.topText});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    bottomText = json['bottomText'];
    image = json['image'];
    name = json['name'];
    rank = json['rank'];
    tags = json['tags'];
    topText = json['topText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['bottomText'] = this.bottomText;
    data['image'] = this.image;
    data['name'] = this.name;
    data['rank'] = this.rank;
    data['tags'] = this.tags;
    data['topText'] = this.topText;
    return data;
  }
}
