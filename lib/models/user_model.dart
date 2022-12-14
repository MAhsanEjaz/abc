class UserModel {
  int? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  String? email;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? phoneNumber;
  bool? twoFactorEnabled;
  String? accessFailedCount;
  String? userName;
  int? roleId;
  String? userPic;
  String? mobile;
  String? city;
  String? taxId;
  String? address;
  String? zipCode;
  String? expiryDate;
  String? lastLogin;
  String? lastChangePwdDate;
  bool? isActive;
  bool? deleted;
  String? createdDate;
  String? modifiedDate;
  String? firstname;
  String? lastname;
  String? imageupload;
  bool? isCancelled;
  int? stateId;
  String? drivingLicense;
  String? fromScreen;
  bool? adminApproval;
  String? state;
  String? refreshToken;
  String? roleName;

  Data(
      {this.id,
      this.email,
      this.emailConfirmed,
      this.passwordHash,
      this.securityStamp,
      this.phoneNumber,
      this.twoFactorEnabled,
      this.accessFailedCount,
      this.userName,
      this.roleId,
      this.userPic,
      this.mobile,
      this.city,
      this.taxId,
      this.address,
      this.zipCode,
      this.expiryDate,
      this.lastLogin,
      this.lastChangePwdDate,
      this.isActive,
      this.deleted,
      this.createdDate,
      this.modifiedDate,
      this.firstname,
      this.lastname,
      this.imageupload,
      this.isCancelled,
      this.stateId,
      this.drivingLicense,
      this.fromScreen,
      this.adminApproval,
      this.state,
      this.refreshToken,
      this.roleName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    phoneNumber = json['phoneNumber'];
    twoFactorEnabled = json['twoFactorEnabled'];
    accessFailedCount = json['accessFailedCount'];
    userName = json['userName'];
    roleId = json['roleId'];
    userPic = json['userPic'];
    mobile = json['mobile'];
    city = json['city'];
    taxId = json['taxId'];
    address = json['address'];
    zipCode = json['zipCode'];
    expiryDate = json['expiryDate'];
    lastLogin = json['lastLogin'];
    lastChangePwdDate = json['lastChangePwdDate'];
    isActive = json['isActive'];
    deleted = json['deleted'];
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    imageupload = json['imageupload'];
    isCancelled = json['isCancelled'];
    stateId = json['stateId'];
    drivingLicense = json['drivingLicense'];
    fromScreen = json['fromScreen'];
    adminApproval = json['adminApproval'];
    state = json['state'];
    refreshToken = json['refreshToken'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['emailConfirmed'] = this.emailConfirmed;
    data['passwordHash'] = this.passwordHash;
    data['securityStamp'] = this.securityStamp;
    data['phoneNumber'] = this.phoneNumber;
    data['twoFactorEnabled'] = this.twoFactorEnabled;
    data['accessFailedCount'] = this.accessFailedCount;
    data['userName'] = this.userName;
    data['roleId'] = this.roleId;
    data['userPic'] = this.userPic;
    data['mobile'] = this.mobile;
    data['city'] = this.city;
    data['taxId'] = this.taxId;
    data['address'] = this.address;
    data['zipCode'] = this.zipCode;
    data['expiryDate'] = this.expiryDate;
    data['lastLogin'] = this.lastLogin;
    data['lastChangePwdDate'] = this.lastChangePwdDate;
    data['isActive'] = this.isActive;
    data['deleted'] = this.deleted;
    data['createdDate'] = this.createdDate;
    data['modifiedDate'] = this.modifiedDate;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['imageupload'] = this.imageupload;
    data['isCancelled'] = this.isCancelled;
    data['stateId'] = this.stateId;
    data['drivingLicense'] = this.drivingLicense;
    data['fromScreen'] = this.fromScreen;
    data['adminApproval'] = this.adminApproval;
    data['state'] = this.state;
    data['refreshToken'] = this.refreshToken;
    data['roleName'] = this.roleName;
    return data;
  }
}
