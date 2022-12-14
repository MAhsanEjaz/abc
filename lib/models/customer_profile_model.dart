class CustomerProfileModel {
  int? status;
  String? message;
  CustomerProfileData? data;

  CustomerProfileModel({this.status, this.message, this.data});

  CustomerProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new CustomerProfileData.fromJson(json['data']) : null;
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

class CustomerProfileData {
  int? id;
  String? company;
  String? firstName;
  String? lastName;
  String? street;
  String? city;
  String? state;
  String? zip;
  String? country;
  bool? checkAddress;
  String? phone;
  String? fax;
  String? cell;
  int? providerId;
  String? provider;
  String? other;
  String? email;
  String? website;
  String? taxIdfein;
  String? stateIdnumber;
  String? tobaccoLicenseNumber;
  String? vendor;
  String? cigaretteLicenseNumber;
  String? dea;
  String? memo;
  int? customerTypeId;
  String? customerType;
  String? dob;
  String? ssn;
  String? drivingLicenseNumber;
  String? drivingLicenseStateId;
  String? drivingLicenseState;
  String? ownerAddress;
  String? businessAddress;
  String? vehicleNumber;
  bool? authorized;
  String? customerCode;
  String? balance;
  String? gender;
  int? stateId;
  String? accountNumber;
  String? accountId;
  String? accountTitle;
  bool? adminApproved;
  int? userId;
  String? fromScreen;
  String? fullName;
  String? businessName;
  String? mobile;
  String? customerState;
  String? stateResaleTaxId;
  String? drivingLicense;
  String? cigratteLicenceNumber;
  String? postalCode;
  String? registrationType;
  String? address;
  String? mailingAddress;
  String? taxExempt;
  bool? approved;
  bool? rejected;
  bool? pending;
  String? certificateBusinessTypes;
  String? certificateExemptionInstructions;
  String? certificateIdentifications;
  String? certificateReasonExemptions;
  String? paperWork;
  String? confirmPassword;
  String? aspNetUser;
  String? receivable;
  String? customerClassification;
  String? customerBillingInfo;
  String? empBusinesss;
  String? empIdentification;
  String? empReasonExemption;

  CustomerProfileData(
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

  CustomerProfileData.fromJson(Map<String, dynamic> json) {
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
    certificateBusinessTypes = json['certificateBusinessTypes'];
    certificateExemptionInstructions = json['certificateExemptionInstructions'];
    certificateIdentifications = json['certificateIdentifications'];
    certificateReasonExemptions = json['certificateReasonExemptions'];
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
    data['certificateBusinessTypes'] = this.certificateBusinessTypes;
    data['certificateExemptionInstructions'] =
        this.certificateExemptionInstructions;
    data['certificateIdentifications'] = this.certificateIdentifications;
    data['certificateReasonExemptions'] = this.certificateReasonExemptions;
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
