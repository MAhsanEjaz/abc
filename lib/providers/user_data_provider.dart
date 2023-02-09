import 'package:abc_cash_and_carry/models/new_user_model.dart';
import 'package:abc_cash_and_carry/models/user_model.dart';
import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  UserModel? user;
  updateUserData({UserModel? newUser}) {
    user = newUser;
    notifyListeners();
  }
}
