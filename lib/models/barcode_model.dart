import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';

class BarcodeModel {
  int? status;
  String? message;
  ProductModel? data;

  BarcodeModel({this.status, this.message, this.data});

  BarcodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? new ProductModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
