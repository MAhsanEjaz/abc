class Category {
  int? status;
  String? message;
  List<CatData>? data;

  Category({this.status, this.message, this.data});

  Category.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CatData>[];
      json['data'].forEach((v) {
        data!.add(new CatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CatData {
  int? id;
  String? name;
  Null? categoryImage;
  Null? categoryImageByPath;
  Null? color;

  CatData(
      {this.id,
        this.name,
        this.categoryImage,
        this.categoryImageByPath,
        this.color});

  CatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryImage = json['categoryImage'];
    categoryImageByPath = json['categoryImageByPath'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['categoryImage'] = this.categoryImage;
    data['categoryImageByPath'] = this.categoryImageByPath;
    data['color'] = this.color;
    return data;
  }
}
