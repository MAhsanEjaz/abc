class ItemSubCategory {
  int? status;
  String? message;
  List<SubCategories>? data;

  ItemSubCategory({this.status, this.message, this.data});

  ItemSubCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SubCategories>[];
      json['data'].forEach((v) {
        data!.add(new SubCategories.fromJson(v));
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

class SubCategories {
  int? id;
  int? categoryId;
  String? subCategory;
  String? parentCategoryName;

  SubCategories(
      {this.id, this.categoryId, this.subCategory, this.parentCategoryName});

  SubCategories.fromJson(Map<String, dynamic> json) {
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
