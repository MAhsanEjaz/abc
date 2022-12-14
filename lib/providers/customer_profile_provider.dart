import 'package:abc_cash_and_carry/models/customer_profile_model.dart';
import 'package:flutter/cupertino.dart';

class CustomerProfileProvider extends ChangeNotifier {
  CustomerProfileData? customerProfileData;

  getCustomerData({CustomerProfileData? newCustomerProfileData}) {
    customerProfileData = newCustomerProfileData;
    notifyListeners();
  }
}
