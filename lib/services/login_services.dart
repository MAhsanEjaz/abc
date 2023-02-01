  import 'dart:convert';
import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_post_request_service.dart';
import 'package:abc_cash_and_carry/models/user_model.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helper_services/token_save_service.dart';

class LoginApiService {
  Future loginService(
      {required BuildContext context, String? password, String? email}) async {
    Map body = {"email": email, "passwordHash": password};

    try {
      var res = await PostRequestService()
          .httpPostRequest(url: loginUrl, body: body, context: context);

      // res.body['status'] != null && res.body['status'] == 1

      if (res != null) {
        UserModel user = UserModel.fromJson(res);

        ///log('logged in user -> ${user.toJson()}');
        await LocalStorageService()
            .saveBearerToken(context, user.data!.refreshToken!);
        await LocalStorageService()
            .saveUser(context: context, user: jsonEncode(user.toJson()));
        Provider.of<UserDataProvider>(context, listen: false)
            .updateUserData(newUser: user);
        // provider data storage
        // remember user logged in
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print('exception in loginApiService --> $err');
      return false;
    }
  }
}


