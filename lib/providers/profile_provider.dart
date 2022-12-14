import 'package:abc_cash_and_carry/models/profile_model.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileData? profileModel;

  updateProfile({ProfileData? newProfileModel}) {
    profileModel = newProfileModel;
    notifyListeners();
  }
}
