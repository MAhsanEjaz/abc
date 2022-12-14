class BasketLengthModel {
  int? status;
  String? message;
  List<BasketData>? data;

  BasketLengthModel({this.status, this.message, this.data});

  BasketLengthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BasketData>[];
      json['data'].forEach((v) {
        data!.add(new BasketData.fromJson(v));
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

class BasketData {
  int? cartId;
  int? id;
  int? userId;
  String? productCode;
  String? name;
  Null? imagePath;
  Null? unitCharge;
  String? retail;
  String? total;
  int? quantity;
  Null? count;
  bool? pendingForApproval;
  bool? isDelivered;
  String? ticketId;
  String? tax;
  String? totalTaxes;
  Null? orderDate;
  Null? deliveredDate;
  Null? deliveredBy;
  Null? paymentMode;
  Null? cardTax;
  Null? productObj;
  Null? imageURL;
  Null? type;
  Null? balance;
  Null? customerOrders;
  Null? orderTotalBalance;

  BasketData(
      {this.cartId,
        this.id,
        this.userId,
        this.productCode,
        this.name,
        this.imagePath,
        this.unitCharge,
        this.retail,
        this.total,
        this.quantity,
        this.count,
        this.pendingForApproval,
        this.isDelivered,
        this.ticketId,
        this.tax,
        this.totalTaxes,
        this.orderDate,
        this.deliveredDate,
        this.deliveredBy,
        this.paymentMode,
        this.cardTax,
        this.productObj,
        this.imageURL,
        this.type,
        this.balance,
        this.customerOrders,
        this.orderTotalBalance});

  BasketData.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    id = json['id'];
    userId = json['userId'];
    productCode = json['productCode'];
    name = json['name'];
    imagePath = json['imagePath'];
    unitCharge = json['unitCharge'];
    retail = json['retail'];
    total = json['total'];
    quantity = json['quantity'];
    count = json['count'];
    pendingForApproval = json['pendingForApproval'];
    isDelivered = json['isDelivered'];
    ticketId = json['ticketId'];
    tax = json['tax'];
    totalTaxes = json['totalTaxes'];
    orderDate = json['orderDate'];
    deliveredDate = json['deliveredDate'];
    deliveredBy = json['deliveredBy'];
    paymentMode = json['paymentMode'];
    cardTax = json['cardTax'];
    productObj = json['productObj'];
    imageURL = json['imageURL'];
    type = json['type'];
    balance = json['balance'];
    customerOrders = json['customerOrders'];
    orderTotalBalance = json['orderTotalBalance'];
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
    data['paymentMode'] = this.paymentMode;
    data['cardTax'] = this.cardTax;
    data['productObj'] = this.productObj;
    data['imageURL'] = this.imageURL;
    data['type'] = this.type;
    data['balance'] = this.balance;
    data['customerOrders'] = this.customerOrders;
    data['orderTotalBalance'] = this.orderTotalBalance;
    return data;
  }
}
