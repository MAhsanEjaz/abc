class PaymentMethodsModel {
  int ?status;
  String? message;
  List<PaymentMethodModel>? data;

  PaymentMethodsModel({this.status, this.message, this.data});

  PaymentMethodsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new PaymentMethodModel.fromJson(v));
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

class PaymentMethodModel {
  String ?paymentMethodName;
  String ?paymentMethodImage;
  String ?paymentMethodId;

  PaymentMethodModel({this.paymentMethodName, this.paymentMethodImage, this.paymentMethodId});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    paymentMethodName = json['payment_method_name'];
    paymentMethodImage = json['payment_method_image'];
    paymentMethodId = json['payment_method_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_method_name'] = this.paymentMethodName;
    data['payment_method_image'] = this.paymentMethodImage;
    data['payment_method_id'] = this.paymentMethodId;
    return data;
  }
}
