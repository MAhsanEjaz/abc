class CartResponseModel {
  int? status;
  String? message;
  List<CartItemModel>? data;

  CartResponseModel({this.status, this.message, this.data});

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CartItemModel>[];
      json['data'].forEach((v) {
        data!.add(new CartItemModel.fromJson(v));
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

class CartItemModel {
  int? cartId;
  int? id;
  int? userId;
  String? productCode;
  String? name;
  String? imagePath;
  String? unitCharge;
  String? retail;
  String? total;
  double? totalPrice;
  int quantity = 1;
  Null? count;
  bool? pendingForApproval;
  bool? isDelivered;
  String? ticketId;
  String? tax;
  String? totalTaxes;
  String? orderDate;
  String? deliveredDate;
  Null? deliveredBy;
  Null? productObj;
  String? imageURL;
  Null? type;

  CartItemModel(
      {this.cartId,
      this.id,
      this.userId,
      this.productCode,
      this.name,
      this.imagePath,
      this.unitCharge,
      this.retail,
      this.total,
      this.quantity = 1,
      this.totalPrice,
      this.count,
      this.pendingForApproval,
      this.isDelivered,
      this.ticketId,
      this.tax,
      this.totalTaxes,
      this.orderDate,
      this.deliveredDate,
      this.deliveredBy,
      this.productObj,
      this.imageURL,
      this.type});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    id = json['id'];
    userId = json['userId'];
    productCode = json['productCode'];
    name = json['name'];
    imagePath = json['imagePath'];
    unitCharge = json['unitCharge'];
    retail = json['retail'];
    total = json['total'];
    quantity = json['quantity'] ?? 0;
    totalPrice = double.parse(retail!) * quantity;
    count = json['count'];
    pendingForApproval = json['pendingForApproval'];
    isDelivered = json['isDelivered'];
    ticketId = json['ticketId'];
    tax = json['tax'];
    totalTaxes = json['totalTaxes'];
    orderDate = json['orderDate'];
    deliveredDate = json['deliveredDate'];
    deliveredBy = json['deliveredBy'];
    productObj = json['productObj'];
    imageURL = json['imageURL'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartId'] = this.cartId;
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['productCode'] = this.productCode;
    data['name'] = this.name;
    data['imagePath'] = this.imagePath;
    data['unitCharge'] = this.unitCharge;
    data['retail'] = this.retail;
    data['total'] = this.total;
    data['quantity'] = this.quantity;
    data['count'] = this.count;
    data['pendingForApproval'] = this.pendingForApproval;
    data['isDelivered'] = this.isDelivered;
    data['ticketId'] = this.ticketId;
    data['tax'] = this.tax;
    data['totalTaxes'] = this.totalTaxes;
    data['orderDate'] = this.orderDate;
    data['deliveredDate'] = this.deliveredDate;
    data['deliveredBy'] = this.deliveredBy;
    data['productObj'] = this.productObj;
    data['imageURL'] = this.imageURL;
    data['type'] = this.type;
    return data;
  }
}
