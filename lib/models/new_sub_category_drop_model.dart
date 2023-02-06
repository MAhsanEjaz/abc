class SubCategory {
  int? status;
  String? message;
  List<NewSubCategory>? data;

  SubCategory({this.status, this.message, this.data});

  SubCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NewSubCategory>[];
      json['data'].forEach((v) {
        data!.add(new NewSubCategory.fromJson(v));
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

class NewSubCategory {
  int? id;
  Null? categoryId;
  String? subCategory;
  Null? parentCategoryName;

  NewSubCategory({this.id, this.categoryId, this.subCategory, this.parentCategoryName});

  NewSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    subCategory = json['subCategory'];
    parentCategoryName = json['parentCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['subCategory'] = this.subCategory;
    data['parentCategoryName'] = this.parentCategoryName;
    return data;
  }
}
