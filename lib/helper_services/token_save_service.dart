import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future saveBearerToken(BuildContext context, String bearerToken) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', bearerToken);
    return true;
  }

  Future getBearerToken(BuildContext context) async {
    final _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    return token;
  }

  Future saveUser({required BuildContext context, required String user}) async {
    print('saving user : $user');
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString('user', user);
  }

  Future getUserSavedData({required BuildContext context}) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getString('user');
  }

  Future savePayment({required BuildContext context, String? pay}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('key', pay!);
    // return false;
  }

  Future getPayment({required BuildContext context}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('key');
  }

  Future saveOnboard({required BuildContext context, bool saveBoard = false}) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('setBoard', saveBoard);
    return false;
  }

  Future getOnboard({required BuildContext context}) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.get('setBoard');

  }
}
