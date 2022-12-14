import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';

class ItemGetSubCategories {
  int? status;
  String? message;
  List<ProductModel>? data;

  ItemGetSubCategories({this.status, this.message, this.data});

  ItemGetSubCategories.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductModel.fromJson(v));
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


