

class InventoryItemGetModel {
  int? status;
  String? message;
  List<ProductModel>? data;

  InventoryItemGetModel({this.status, this.message, this.data});

  InventoryItemGetModel.fromJson(Map<String, dynamic> json) {
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

class ProductModel {
  Null? stock;
  String? financial;
  String? purchaseOrders;
  String? saleOrders;
  String? vendors;
  String? stTax;
  String? supplierItemNumber;
  int? id;
  String? name;
  int? itemCategoryId;
  int? brandId;
  int? articleId;
  int? storeId;
  String? unit;
  String? productCode;
  String? barCode;
  String? size;
  int? colorId;
  String? sku;
  String? description;
  String? unitRetail;
  String? saleRetail;
  bool? taxExempt;
  bool? shippingEnable;
  bool? allowECommerce;
  String? createdDate;
  String? createdBy;
  String? modifiedBy;
  String? modifiedDate;
  String? oldPrice;
  String? msareportAs;
  String? stateReportAs;
  String? reportingWeight;
  int? familyId;
  String? family;
  String? qtyUnit;
  String? unitsInPack;
  String? retailPackPrice;
  String? salesLimit;
  String? adjustment;
  String? profitPercentage;
  String? cost;
  String? mfgPromotion;
  String? addtoCostPercenatge;
  String? unitCharge;
  String? outofstateCost;
  String? outofstateRetail;
  bool? taxonSale;
  bool? taxOnPurchase;
  String? location;
  int? groupId;
  String? itemNumber;
  String? qtyinStock;
  int? itemSubCategoryId;
  int? modelId;
  String? modelName;
  String? categoryName;
  String? subCatName;
  String? groupName;
  String? brandName;
  String? colorName;
  String? itemImage;
  String? itemImageByPath;
  String? variations;
  String? discountPrice;
  String? rating;
  String? minOrderQty;
  String? maxOrderQty;
  String? retail;
  String? quantityCase;
  String? quantityPallet;
  String? singleUnitMsa;
  int? misPickId;
  String? misPickName;
  String? orderQuantity;
  String? units;
  String? weightOz;
  String? weightLb;
  String? locationTwo;
  String? locationThree;
  String? locationFour;
  String? maintainStockForDays;
  bool? isActive;
  String? stockItemNumber;
  String? shipmentLimit;
  String? barCodePath;
  bool? needHighAuthorization;
  String? highlimitOn;
  String? sttaxOnCost;
  String? sttaxOnSale;
  String? sttaxRate;
  String? sttaxPerQty;
  String? priceDiff;
  String? priceDiffPercentage;

  ProductModel(
      {this.stock,
      this.financial,
      this.purchaseOrders,
      this.saleOrders,
      this.vendors,
      this.stTax,
      this.supplierItemNumber,
      this.id,
      this.name,
      this.itemCategoryId,
      this.brandId,
      this.articleId,
      this.storeId,
      this.unit,
      this.productCode,
      this.barCode,
      this.size,
      this.colorId,
      this.sku,
      this.description,
      this.unitRetail,
      this.saleRetail,
      this.taxExempt,
      this.shippingEnable,
      this.allowECommerce,
      this.createdDate,
      this.createdBy,
      this.modifiedBy,
      this.modifiedDate,
      this.oldPrice,
      this.msareportAs,
      this.stateReportAs,
      this.reportingWeight,
      this.familyId,
      this.family,
      this.qtyUnit,
      this.unitsInPack,
      this.retailPackPrice,
      this.salesLimit,
      this.adjustment,
      this.profitPercentage,
      this.cost,
      this.mfgPromotion,
      this.addtoCostPercenatge,
      this.unitCharge,
      this.outofstateCost,
      this.outofstateRetail,
      this.taxonSale,
      this.taxOnPurchase,
      this.location,
      this.groupId,
      this.itemNumber,
      this.qtyinStock,
      this.itemSubCategoryId,
      this.modelId,
      this.modelName,
      this.categoryName,
      this.subCatName,
      this.groupName,
      this.brandName,
      this.colorName,
      this.itemImage,
      this.itemImageByPath,
      this.variations,
      this.discountPrice,
      this.rating,
      this.minOrderQty,
      this.maxOrderQty,
      this.retail,
      this.quantityCase,
      this.quantityPallet,
      this.singleUnitMsa,
      this.misPickId,
      this.misPickName,
      this.orderQuantity,
      this.units,
      this.weightOz,
      this.weightLb,
      this.locationTwo,
      this.locationThree,
      this.locationFour,
      this.maintainStockForDays,
      this.isActive,
      this.stockItemNumber,
      this.shipmentLimit,
      this.barCodePath,
      this.needHighAuthorization,
      this.highlimitOn,
      this.sttaxOnCost,
      this.sttaxOnSale,
      this.sttaxRate,
      this.sttaxPerQty,
      this.priceDiff,
      this.priceDiffPercentage});

  ProductModel.fromJson(Map<String, dynamic> json) {
    stock = json['stock'];
    financial = json['financial'];
    purchaseOrders = json['purchaseOrders'];
    saleOrders = json['saleOrders'];
    vendors = json['vendors'];
    stTax = json['stTax'];
    supplierItemNumber = json['supplierItemNumber'];
    id = json['id'];
    name = json['name'];
    itemCategoryId = json['itemCategoryId'];
    brandId = json['brandId'];
    articleId = json['articleId'];
    storeId = json['storeId'];
    unit = json['unit'];
    productCode = json['productCode'];
    barCode = json['barCode'];
    size = json['size'];
    colorId = json['colorId'];
    sku = json['sku'];
    description = json['description'];
    unitRetail = json['unitRetail'];
    saleRetail = json['saleRetail'];
    taxExempt = json['taxExempt'];
    shippingEnable = json['shippingEnable'];
    allowECommerce = json['allowECommerce'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
    oldPrice = json['oldPrice'];
    msareportAs = json['msareportAs'];
    stateReportAs = json['stateReportAs'];
    reportingWeight = json['reportingWeight'];
    familyId = json['familyId'];
    family = json['family'];
    qtyUnit = json['qtyUnit'];
    unitsInPack = json['unitsInPack'];
    retailPackPrice = json['retailPackPrice'];
    salesLimit = json['salesLimit'];
    adjustment = json['adjustment'];
    profitPercentage = json['profitPercentage'];
    cost = json['cost'];
    mfgPromotion = json['mfgPromotion'];
    addtoCostPercenatge = json['addtoCostPercenatge'];
    unitCharge = json['unitCharge'];
    outofstateCost = json['outofstateCost'];
    outofstateRetail = json['outofstateRetail'];
    taxonSale = json['taxonSale'];
    taxOnPurchase = json['taxOnPurchase'];
    location = json['location'];
    groupId = json['groupId'];
    itemNumber = json['itemNumber'];
    qtyinStock = json['qtyinStock'];
    itemSubCategoryId = json['itemSubCategoryId'];
    modelId = json['modelId'];
    modelName = json['modelName'];
    categoryName = json['categoryName'];
    subCatName = json['subCatName'];
    groupName = json['groupName'];
    brandName = json['brandName'];
    colorName = json['colorName'];
    itemImage = json['itemImage'];
    itemImageByPath = json['itemImageByPath'];
    variations = json['variations'];
    discountPrice = json['discountPrice'];
    rating = json['rating'];
    minOrderQty = json['minOrderQty'];
    maxOrderQty = json['maxOrderQty'];
    retail = json['retail'];
    quantityCase = json['quantityCase'];
    quantityPallet = json['quantityPallet'];
    singleUnitMsa = json['singleUnitMsa'];
    misPickId = json['misPickId'];
    misPickName = json['misPickName'];
    orderQuantity = json['orderQuantity'];
    units = json['units'];
    weightOz = json['weightOz'];
    weightLb = json['weightLb'];
    locationTwo = json['locationTwo'];
    locationThree = json['locationThree'];
    locationFour = json['locationFour'];
    maintainStockForDays = json['maintainStockForDays'];
    isActive = json['isActive'];
    stockItemNumber = json['stockItemNumber'];
    shipmentLimit = json['shipmentLimit'];
    barCodePath = json['barCodePath'];
    needHighAuthorization = json['needHighAuthorization'];
    highlimitOn = json['highlimitOn'];
    sttaxOnCost = json['sttaxOnCost'];
    sttaxOnSale = json['sttaxOnSale'];
    sttaxRate = json['sttaxRate'];
    sttaxPerQty = json['sttaxPerQty'];
    priceDiff = json['priceDiff'];
    priceDiffPercentage = json['priceDiffPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stock'] = this.stock;
    data['financial'] = this.financial;
    data['purchaseOrders'] = this.purchaseOrders;
    data['saleOrders'] = this.saleOrders;
    data['vendors'] = this.vendors;
    data['stTax'] = this.stTax;
    data['supplierItemNumber'] = this.supplierItemNumber;
    data['id'] = this.id;
    data['name'] = this.name;
    data['itemCategoryId'] = this.itemCategoryId;
    data['brandId'] = this.brandId;
    data['articleId'] = this.articleId;
    data['storeId'] = this.storeId;
    data['unit'] = this.unit;
    data['productCode'] = this.productCode;
    data['barCode'] = this.barCode;
    data['size'] = this.size;
    data['colorId'] = this.colorId;
    data['sku'] = this.sku;
    data['description'] = this.description;
    data['unitRetail'] = this.unitRetail;
    data['saleRetail'] = this.saleRetail;
    data['taxExempt'] = this.taxExempt;
    data['shippingEnable'] = this.shippingEnable;
    data['allowECommerce'] = this.allowECommerce;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedDate'] = this.modifiedDate;
    data['oldPrice'] = this.oldPrice;
    data['msareportAs'] = this.msareportAs;
    data['stateReportAs'] = this.stateReportAs;
    data['reportingWeight'] = this.reportingWeight;
    data['familyId'] = this.familyId;
    data['family'] = this.family;
    data['qtyUnit'] = this.qtyUnit;
    data['unitsInPack'] = this.unitsInPack;
    data['retailPackPrice'] = this.retailPackPrice;
    data['salesLimit'] = this.salesLimit;
    data['adjustment'] = this.adjustment;
    data['profitPercentage'] = this.profitPercentage;
    data['cost'] = this.cost;
    data['mfgPromotion'] = this.mfgPromotion;
    data['addtoCostPercenatge'] = this.addtoCostPercenatge;
    data['unitCharge'] = this.unitCharge;
    data['outofstateCost'] = this.outofstateCost;
    data['outofstateRetail'] = this.outofstateRetail;
    data['taxonSale'] = this.taxonSale;
    data['taxOnPurchase'] = this.taxOnPurchase;
    data['location'] = this.location;
    data['groupId'] = this.groupId;
    data['itemNumber'] = this.itemNumber;
    data['qtyinStock'] = this.qtyinStock;
    data['itemSubCategoryId'] = this.itemSubCategoryId;
    data['modelId'] = this.modelId;
    data['modelName'] = this.modelName;
    data['categoryName'] = this.categoryName;
    data['subCatName'] = this.subCatName;
    data['groupName'] = this.groupName;
    data['brandName'] = this.brandName;
    data['colorName'] = this.colorName;
    data['itemImage'] = this.itemImage;
    data['itemImageByPath'] = this.itemImageByPath;
    data['variations'] = this.variations;
    data['discountPrice'] = this.discountPrice;
    data['rating'] = this.rating;
    data['minOrderQty'] = this.minOrderQty;
    data['maxOrderQty'] = this.maxOrderQty;
    data['retail'] = this.retail;
    data['quantityCase'] = this.quantityCase;
    data['quantityPallet'] = this.quantityPallet;
    data['singleUnitMsa'] = this.singleUnitMsa;
    data['misPickId'] = this.misPickId;
    data['misPickName'] = this.misPickName;
    data['orderQuantity'] = this.orderQuantity;
    data['units'] = this.units;
    data['weightOz'] = this.weightOz;
    data['weightLb'] = this.weightLb;
    data['locationTwo'] = this.locationTwo;
    data['locationThree'] = this.locationThree;
    data['locationFour'] = this.locationFour;
    data['maintainStockForDays'] = this.maintainStockForDays;
    data['isActive'] = this.isActive;
    data['stockItemNumber'] = this.stockItemNumber;
    data['shipmentLimit'] = this.shipmentLimit;
    data['barCodePath'] = this.barCodePath;
    data['needHighAuthorization'] = this.needHighAuthorization;
    data['highlimitOn'] = this.highlimitOn;
    data['sttaxOnCost'] = this.sttaxOnCost;
    data['sttaxOnSale'] = this.sttaxOnSale;
    data['sttaxRate'] = this.sttaxRate;
    data['sttaxPerQty'] = this.sttaxPerQty;
    data['priceDiff'] = this.priceDiff;
    data['priceDiffPercentage'] = this.priceDiffPercentage;
    return data;
  }
}
