class GetOrdersModel {
  int? status;
  String? message;
  List<OrderModel>? data;

  GetOrdersModel({this.status, this.message, this.data});

  GetOrdersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderModel>[];
      json['data'].forEach((v) {
        data!.add(new OrderModel.fromJson(v));
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

class OrderModel {
  int? orderId;
  int? userId;
  String? ticketId;
  String? customerName;
  String? billingAddress;
  String? phone;
  String? email;
  String? city;
  String? zipcode;
  String? country;
  bool? adminStatus;
  bool? delivered;
  String? orderAmount;
  String? taxAmount;
  String? orderDate;
  bool? isPulled;
  bool? isRejected;
  String? adminActionBy;
  String? adminActionDate;
  String? terminalNumber;
  String? adminActionTime;
  String? pulledBy;
  String? deliveredBy;
  String? pulledDate;
  String? pulledTime;
  String? deliveredDate;
  String? deliveredTime;
  String? rejectReason;
  String? paymentMode;
  String? cardTax;
  bool? isInvoiced;
  String? invoicedBy;
  String? invoicedDate;
  String? quantity;
  String? productName;
  String? price;
  String? invoicedTime;
  int? pullerEmployeeId;
  String? customerCode;
  String? orignalStatus;
  String? balance;
  bool? orderDaysAlert;
  int? lineCounts;

  OrderModel(
      {this.orderId,
      this.userId,
      this.ticketId,
      this.customerName,
      this.billingAddress,
      this.phone,
      this.email,
      this.city,
      this.zipcode,
      this.country,
      this.adminStatus,
      this.delivered,
      this.orderAmount,
      this.taxAmount,
      this.orderDate,
      this.isPulled,
      this.isRejected,
      this.adminActionBy,
      this.adminActionDate,
      this.terminalNumber,
      this.adminActionTime,
      this.pulledBy,
      this.deliveredBy,
      this.pulledDate,
      this.pulledTime,
      this.deliveredDate,
      this.deliveredTime,
      this.rejectReason,
      this.paymentMode,
      this.cardTax,
      this.isInvoiced,
      this.invoicedBy,
      this.invoicedDate,
      this.quantity,
      this.productName,
      this.price,
      this.invoicedTime,
      this.pullerEmployeeId,
      this.customerCode,
      this.orignalStatus,
      this.balance,
      this.orderDaysAlert,
      this.lineCounts});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    userId = json['userId'];
    ticketId = json['ticketId'];
    customerName = json['customerName'];
    billingAddress = json['billingAddress'];
    phone = json['phone'];
    email = json['email'];
    city = json['city'];
    zipcode = json['zipcode'];
    country = json['country'];
    adminStatus = json['adminStatus'];
    delivered = json['delivered'];
    orderAmount = json['orderAmount'];
    taxAmount = json['taxAmount'];
    orderDate = json['orderDate'];
    isPulled = json['isPulled'];
    isRejected = json['isRejected'];
    adminActionBy = json['adminActionBy'];
    adminActionDate = json['adminActionDate'];
    terminalNumber = json['terminalNumber'];
    adminActionTime = json['adminActionTime'];
    pulledBy = json['pulledBy'];
    deliveredBy = json['deliveredBy'];
    pulledDate = json['pulledDate'];
    pulledTime = json['pulledTime'];
    deliveredDate = json['deliveredDate'];
    deliveredTime = json['deliveredTime'];
    rejectReason = json['rejectReason'];
    paymentMode = json['paymentMode'];
    cardTax = json['cardTax'];
    isInvoiced = json['isInvoiced'];
    invoicedBy = json['invoicedBy'];
    invoicedDate = json['invoicedDate'];
    quantity = json['quantity'];
    productName = json['productName'];
    price = json['price'];
    invoicedTime = json['invoicedTime'];
    pullerEmployeeId = json['pullerEmployeeId'];
    customerCode = json['customerCode'];
    orignalStatus = json['orignalStatus'];
    balance = json['balance'];
    orderDaysAlert = json['orderDaysAlert'];
    lineCounts = json['lineCounts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['userId'] = this.userId;
    data['ticketId'] = this.ticketId;
    data['customerName'] = this.customerName;
    data['billingAddress'] = this.billingAddress;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    data['country'] = this.country;
    data['adminStatus'] = this.adminStatus;
    data['delivered'] = this.delivered;
    data['orderAmount'] = this.orderAmount;
    data['taxAmount'] = this.taxAmount;
    data['orderDate'] = this.orderDate;
    data['isPulled'] = this.isPulled;
    data['isRejected'] = this.isRejected;
    data['adminActionBy'] = this.adminActionBy;
    data['adminActionDate'] = this.adminActionDate;
    data['terminalNumber'] = this.terminalNumber;
    data['adminActionTime'] = this.adminActionTime;
    data['pulledBy'] = this.pulledBy;
    data['deliveredBy'] = this.deliveredBy;
    data['pulledDate'] = this.pulledDate;
    data['pulledTime'] = this.pulledTime;
    data['deliveredDate'] = this.deliveredDate;
    data['deliveredTime'] = this.deliveredTime;
    data['rejectReason'] = this.rejectReason;
    data['paymentMode'] = this.paymentMode;
    data['cardTax'] = this.cardTax;
    data['isInvoiced'] = this.isInvoiced;
    data['invoicedBy'] = this.invoicedBy;
    data['invoicedDate'] = this.invoicedDate;
    data['quantity'] = this.quantity;
    data['productName'] = this.productName;
    data['price'] = this.price;
    data['invoicedTime'] = this.invoicedTime;
    data['pullerEmployeeId'] = this.pullerEmployeeId;
    data['customerCode'] = this.customerCode;
    data['orignalStatus'] = this.orignalStatus;
    data['balance'] = this.balance;
    data['orderDaysAlert'] = this.orderDaysAlert;
    data['lineCounts'] = this.lineCounts;
    return data;
  }
}
