class ProfileModel {
  int? status;
  String? message;
  ProfileData? data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
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

class ProfileData {
  int? id;
  String? company;
  String? firstName;
  String? lastName;
  String? street;
  String? city;
  String? state;
  Null? zip;
  String? country;
  String? checkAddress;
  String? phone;
  String? fax;
  String? cell;
  Null? providerId;
  Null? provider;
  Null? other;
  String? email;
  String? website;
  String? taxIdfein;
  Null? stateIdnumber;
  String? tobaccoLicenseNumber;
  Null? vendor;
  Null? cigaretteLicenseNumber;
  String? dea;
  Null? memo;
  Null? customerTypeId;
  Null? customerType;
  String? dob;
  Null? ssn;
  Null? drivingLicenseNumber;
  Null? drivingLicenseStateId;
  Null? drivingLicenseState;
  String? ownerAddress;
  String? businessAddress;
  Null? vehicleNumber;
  Null? authorized;
  String? customerCode;
  Null? balance;
  Null? gender;
  Null? stateId;
  String? accountNumber;
  String? accountId;
  String? accountTitle;
  bool? adminApproved;
  Null? userId;
  String? fromScreen;
  String? fullName;
  String? businessName;
  String? mobile;
  String? customerState;
  String? stateResaleTaxId;
  String? drivingLicense;
  String? cigratteLicenceNumber;
  Null? postalCode;
  String? registrationType;
  Null? address;
  Null? mailingAddress;
  Null? taxExempt;
  bool? approved;
  bool? rejected;
  bool? pending;
  List<Null>? certificateBusinessTypes;
  CertificateExemptionInstructions? certificateExemptionInstructions;
  List<CertificateIdentifications>? certificateIdentifications;
  List<Null>? certificateReasonExemptions;
  Null? paperWork;
  Null? confirmPassword;
  Null? aspNetUser;
  Null? receivable;
  Null? customerClassification;
  Null? customerBillingInfo;
  Null? empBusinesss;
  Null? empIdentification;
  Null? empReasonExemption;

  ProfileData(
      {this.id,
      this.company,
      this.firstName,
      this.lastName,
      this.street,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.checkAddress,
      this.phone,
      this.fax,
      this.cell,
      this.providerId,
      this.provider,
      this.other,
      this.email,
      this.website,
      this.taxIdfein,
      this.stateIdnumber,
      this.tobaccoLicenseNumber,
      this.vendor,
      this.cigaretteLicenseNumber,
      this.dea,
      this.memo,
      this.customerTypeId,
      this.customerType,
      this.dob,
      this.ssn,
      this.drivingLicenseNumber,
      this.drivingLicenseStateId,
      this.drivingLicenseState,
      this.ownerAddress,
      this.businessAddress,
      this.vehicleNumber,
      this.authorized,
      this.customerCode,
      this.balance,
      this.gender,
      this.stateId,
      this.accountNumber,
      this.accountId,
      this.accountTitle,
      this.adminApproved,
      this.userId,
      this.fromScreen,
      this.fullName,
      this.businessName,
      this.mobile,
      this.customerState,
      this.stateResaleTaxId,
      this.drivingLicense,
      this.cigratteLicenceNumber,
      this.postalCode,
      this.registrationType,
      this.address,
      this.mailingAddress,
      this.taxExempt,
      this.approved,
      this.rejected,
      this.pending,
      this.certificateBusinessTypes,
      this.certificateExemptionInstructions,
      this.certificateIdentifications,
      this.certificateReasonExemptions,
      this.paperWork,
      this.confirmPassword,
      this.aspNetUser,
      this.receivable,
      this.customerClassification,
      this.customerBillingInfo,
      this.empBusinesss,
      this.empIdentification,
      this.empReasonExemption});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    country = json['country'];
    checkAddress = json['checkAddress'];
    phone = json['phone'];
    fax = json['fax'];
    cell = json['cell'];
    providerId = json['providerId'];
    provider = json['provider'];
    other = json['other'];
    email = json['email'];
    website = json['website'];
    taxIdfein = json['taxIdfein'];
    stateIdnumber = json['stateIdnumber'];
    tobaccoLicenseNumber = json['tobaccoLicenseNumber'];
    vendor = json['vendor'];
    cigaretteLicenseNumber = json['cigaretteLicenseNumber'];
    dea = json['dea'];
    memo = json['memo'];
    customerTypeId = json['customerTypeId'];
    customerType = json['customerType'];
    dob = json['dob'];
    ssn = json['ssn'];
    drivingLicenseNumber = json['drivingLicenseNumber'];
    drivingLicenseStateId = json['drivingLicenseStateId'];
    drivingLicenseState = json['drivingLicenseState'];
    ownerAddress = json['ownerAddress'];
    businessAddress = json['businessAddress'];
    vehicleNumber = json['vehicleNumber'];
    authorized = json['authorized'];
    customerCode = json['customerCode'];
    balance = json['balance'];
    gender = json['gender'];
    stateId = json['stateId'];
    accountNumber = json['accountNumber'];
    accountId = json['accountId'];
    accountTitle = json['accountTitle'];
    adminApproved = json['adminApproved'];
    userId = json['userId'];
    fromScreen = json['fromScreen'];
    fullName = json['fullName'];
    businessName = json['businessName'];
    mobile = json['mobile'];
    customerState = json['customerState'];
    stateResaleTaxId = json['stateResaleTaxId'];
    drivingLicense = json['drivingLicense'];
    cigratteLicenceNumber = json['cigratteLicenceNumber'];
    postalCode = json['postalCode'];
    registrationType = json['registrationType'];
    address = json['address'];
    mailingAddress = json['mailingAddress'];
    taxExempt = json['taxExempt'];
    approved = json['approved'];
    rejected = json['rejected'];
    pending = json['pending'];
    // if (json['certificateBusinessTypes'] != null) {
    //   certificateBusinessTypes = <Null>[];
    //   json['certificateBusinessTypes'].forEach((v) {
    //     certificateBusinessTypes!.add(new Null.fromJson(v));
    //   });
    // }
    certificateExemptionInstructions =
        json['certificateExemptionInstructions'] != null
            ? new CertificateExemptionInstructions.fromJson(
                json['certificateExemptionInstructions'])
            : null;
    if (json['certificateIdentifications'] != null) {
      certificateIdentifications = <CertificateIdentifications>[];
      json['certificateIdentifications'].forEach((v) {
        certificateIdentifications!
            .add(new CertificateIdentifications.fromJson(v));
      });
    }
    // if (json['certificateReasonExemptions'] != null) {
    //   certificateReasonExemptions = <Null>[];
    //   json['certificateReasonExemptions'].forEach((v) {
    //     certificateReasonExemptions!.add(new Null.fromJson(v));
    //   });
    // }
    paperWork = json['paperWork'];
    confirmPassword = json['confirmPassword'];
    aspNetUser = json['aspNetUser'];
    receivable = json['receivable'];
    customerClassification = json['customerClassification'];
    customerBillingInfo = json['customerBillingInfo'];
    empBusinesss = json['empBusinesss'];
    empIdentification = json['empIdentification'];
    empReasonExemption = json['empReasonExemption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company'] = this.company;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['country'] = this.country;
    data['checkAddress'] = this.checkAddress;
    data['phone'] = this.phone;
    data['fax'] = this.fax;
    data['cell'] = this.cell;
    data['providerId'] = this.providerId;
    data['provider'] = this.provider;
    data['other'] = this.other;
    data['email'] = this.email;
    data['website'] = this.website;
    data['taxIdfein'] = this.taxIdfein;
    data['stateIdnumber'] = this.stateIdnumber;
    data['tobaccoLicenseNumber'] = this.tobaccoLicenseNumber;
    data['vendor'] = this.vendor;
    data['cigaretteLicenseNumber'] = this.cigaretteLicenseNumber;
    data['dea'] = this.dea;
    data['memo'] = this.memo;
    data['customerTypeId'] = this.customerTypeId;
    data['customerType'] = this.customerType;
    data['dob'] = this.dob;
    data['ssn'] = this.ssn;
    data['drivingLicenseNumber'] = this.drivingLicenseNumber;
    data['drivingLicenseStateId'] = this.drivingLicenseStateId;
    data['drivingLicenseState'] = this.drivingLicenseState;
    data['ownerAddress'] = this.ownerAddress;
    data['businessAddress'] = this.businessAddress;
    data['vehicleNumber'] = this.vehicleNumber;
    data['authorized'] = this.authorized;
    data['customerCode'] = this.customerCode;
    data['balance'] = this.balance;
    data['gender'] = this.gender;
    data['stateId'] = this.stateId;
    data['accountNumber'] = this.accountNumber;
    data['accountId'] = this.accountId;
    data['accountTitle'] = this.accountTitle;
    data['adminApproved'] = this.adminApproved;
    data['userId'] = this.userId;
    data['fromScreen'] = this.fromScreen;
    data['fullName'] = this.fullName;
    data['businessName'] = this.businessName;
    data['mobile'] = this.mobile;
    data['customerState'] = this.customerState;
    data['stateResaleTaxId'] = this.stateResaleTaxId;
    data['drivingLicense'] = this.drivingLicense;
    data['cigratteLicenceNumber'] = this.cigratteLicenceNumber;
    data['postalCode'] = this.postalCode;
    data['registrationType'] = this.registrationType;
    data['address'] = this.address;
    data['mailingAddress'] = this.mailingAddress;
    data['taxExempt'] = this.taxExempt;
    data['approved'] = this.approved;
    data['rejected'] = this.rejected;
    data['pending'] = this.pending;
    // if (this.certificateBusinessTypes != null) {
    //   data['certificateBusinessTypes'] =
    //       this.certificateBusinessTypes!.map((v) => v!.toJson()).toList();
    // }
    if (this.certificateExemptionInstructions != null) {
      data['certificateExemptionInstructions'] =
          this.certificateExemptionInstructions!.toJson();
    }
    if (this.certificateIdentifications != null) {
      data['certificateIdentifications'] =
          this.certificateIdentifications!.map((v) => v.toJson()).toList();
    }
    // if (this.certificateReasonExemptions != null) {
    //   data['certificateReasonExemptions'] =
    //       this.certificateReasonExemptions!.map((v) => v!.toJson()).toList();
    // }
    data['paperWork'] = this.paperWork;
    data['confirmPassword'] = this.confirmPassword;
    data['aspNetUser'] = this.aspNetUser;
    data['receivable'] = this.receivable;
    data['customerClassification'] = this.customerClassification;
    data['customerBillingInfo'] = this.customerBillingInfo;
    data['empBusinesss'] = this.empBusinesss;
    data['empIdentification'] = this.empIdentification;
    data['empReasonExemption'] = this.empReasonExemption;
    return data;
  }
}

class CertificateExemptionInstructions {
  int? ceiid;
  Null? multistateSupplementForm;
  String? postalAbbreviation;
  Null? certificateSinglePurchase;
  String? invoicePurchaseOrderNo;
  String? purchaserName;
  Null? businessAddress;
  Null? purchaserCity;
  Null? purchaserState;
  Null? purchaserZipCode;
  Null? purchaseTaxId;
  Null? stateIssue;
  Null? countryIssue;
  String? fein;
  Null? drivingLicenseNo;
  Null? sellerName;
  Null? sellerAdress;
  Null? sellerCity;
  Null? sellerState;
  Null? sellerZipCode;
  bool? termsCondition;
  String? createdDate;
  int? customerId;
  Null? feinCountry;
  String? signature;
  Null? signatureByPath;

  CertificateExemptionInstructions(
      {this.ceiid,
      this.multistateSupplementForm,
      this.postalAbbreviation,
      this.certificateSinglePurchase,
      this.invoicePurchaseOrderNo,
      this.purchaserName,
      this.businessAddress,
      this.purchaserCity,
      this.purchaserState,
      this.purchaserZipCode,
      this.purchaseTaxId,
      this.stateIssue,
      this.countryIssue,
      this.fein,
      this.drivingLicenseNo,
      this.sellerName,
      this.sellerAdress,
      this.sellerCity,
      this.sellerState,
      this.sellerZipCode,
      this.termsCondition,
      this.createdDate,
      this.customerId,
      this.feinCountry,
      this.signature,
      this.signatureByPath});

  CertificateExemptionInstructions.fromJson(Map<String, dynamic> json) {
    ceiid = json['ceiid'];
    multistateSupplementForm = json['multistateSupplementForm'];
    postalAbbreviation = json['postalAbbreviation'];
    certificateSinglePurchase = json['certificateSinglePurchase'];
    invoicePurchaseOrderNo = json['invoicePurchaseOrderNo'];
    purchaserName = json['purchaserName'];
    businessAddress = json['businessAddress'];
    purchaserCity = json['purchaserCity'];
    purchaserState = json['purchaserState'];
    purchaserZipCode = json['purchaserZipCode'];
    purchaseTaxId = json['purchaseTaxId'];
    stateIssue = json['stateIssue'];
    countryIssue = json['countryIssue'];
    fein = json['fein'];
    drivingLicenseNo = json['drivingLicenseNo'];
    sellerName = json['sellerName'];
    sellerAdress = json['sellerAdress'];
    sellerCity = json['sellerCity'];
    sellerState = json['sellerState'];
    sellerZipCode = json['sellerZipCode'];
    termsCondition = json['termsCondition'];
    createdDate = json['createdDate'];
    customerId = json['customerId'];
    feinCountry = json['feinCountry'];
    signature = json['signature'];
    signatureByPath = json['signatureByPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ceiid'] = this.ceiid;
    data['multistateSupplementForm'] = this.multistateSupplementForm;
    data['postalAbbreviation'] = this.postalAbbreviation;
    data['certificateSinglePurchase'] = this.certificateSinglePurchase;
    data['invoicePurchaseOrderNo'] = this.invoicePurchaseOrderNo;
    data['purchaserName'] = this.purchaserName;
    data['businessAddress'] = this.businessAddress;
    data['purchaserCity'] = this.purchaserCity;
    data['purchaserState'] = this.purchaserState;
    data['purchaserZipCode'] = this.purchaserZipCode;
    data['purchaseTaxId'] = this.purchaseTaxId;
    data['stateIssue'] = this.stateIssue;
    data['countryIssue'] = this.countryIssue;
    data['fein'] = this.fein;
    data['drivingLicenseNo'] = this.drivingLicenseNo;
    data['sellerName'] = this.sellerName;
    data['sellerAdress'] = this.sellerAdress;
    data['sellerCity'] = this.sellerCity;
    data['sellerState'] = this.sellerState;
    data['sellerZipCode'] = this.sellerZipCode;
    data['termsCondition'] = this.termsCondition;
    data['createdDate'] = this.createdDate;
    data['customerId'] = this.customerId;
    data['feinCountry'] = this.feinCountry;
    data['signature'] = this.signature;
    data['signatureByPath'] = this.signatureByPath;
    return data;
  }
}

class CertificateIdentifications {
  int? ciid;
  int? certificateId;
  int? customerId;
  Null? reasonExamption;
  Null? identificationNumber;
  Null? state;

  CertificateIdentifications(
      {this.ciid,
      this.certificateId,
      this.customerId,
      this.reasonExamption,
      this.identificationNumber,
      this.state});

  CertificateIdentifications.fromJson(Map<String, dynamic> json) {
    ciid = json['ciid'];
    certificateId = json['certificateId'];
    customerId = json['customerId'];
    reasonExamption = json['reasonExamption'];
    identificationNumber = json['identificationNumber'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ciid'] = this.ciid;
    data['certificateId'] = this.certificateId;
    data['customerId'] = this.customerId;
    data['reasonExamption'] = this.reasonExamption;
    data['identificationNumber'] = this.identificationNumber;
    data['state'] = this.state;
    return data;
  }
}
