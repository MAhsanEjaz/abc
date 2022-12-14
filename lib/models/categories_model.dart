// import 'package:flutter/cupertino.dart';
//
// class CategoriesModel {
//   int? status;
//   String? message;
//   List<Category>? data;
//
//   CategoriesModel({this.status, this.message, this.data});
//
//   CategoriesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data!.add(new Category.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Category {
//   String? catName;
//   String? catId;
//   String? catImage;
//   int? catColor;
//
//   Category({this.catName, this.catId, this.catImage, this.catColor});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     catName = json['cat_name'];
//     catId = json['cat_id'];
//     catImage = json['cat_image'];
//     catColor = json['cat_color'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cat_name'] = this.catName;
//     data['cat_id'] = this.catId;
//     data['cat_image'] = this.catImage;
//     data['cat_color'] = this.catColor;
//     return data;
//   }
// }
//
// class CategoriesModel {
//   int? status;
//   String? message;
//   List<Category>? data;
//
//   CategoriesModel({this.status, this.message, this.data});
//
//   CategoriesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Category>[];
//       json['data'].forEach((v) {
//         data!.add(new Category.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Category {
//   int? id;
//   String? name;
//   String? categoryImage;
//   String? categoryImageByPath;
//   int? color;
//
//   Category(
//       {this.id,
//         this.name,
//         this.categoryImage,
//         this.categoryImageByPath,
//         this.color});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     categoryImage = json['categoryImage'];
//     categoryImageByPath = json['categoryImageByPath'];
//     color = json['color'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['categoryImage'] = this.categoryImage;
//     data['categoryImageByPath'] = this.categoryImageByPath;
//     data['color'] = this.color;
//     return data;
//   }
// }



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
  String? color;

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

