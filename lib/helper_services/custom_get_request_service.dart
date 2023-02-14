import 'dart:convert';
import 'dart:developer';
import 'package:abc_cash_and_carry/helper_services/token_save_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'custom_error_dialogue.dart';
import 'custom_snackbar.dart';
import 'internet_connectivity_service.dart';

class GetRequestService {
  Future httpGetRequest(
      {required String url, required BuildContext context}) async {

    // print('get request url -->$url');

    try {
      bool isConnected = await InternetCheckService.checkInternet();
      if (!isConnected) {
        CustomErrorDialogue.showDialogue(context: context);
        return null;
      }

      String? token = await LocalStorageService().getBearerToken(context);

      var headers = {
        "accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      };

      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      // print('get response status code -->${response.statusCode}');
      // log('get request body -->${response.body}');

      var jsonDecoded = json.decode(response.body);

      if (response.statusCode != 200) {
        CustomSnackBar.failedSnackBar(
            context: context, message: jsonDecoded['message']);
        return null;
      } else {
        return jsonDecoded;
      }
    } catch (err) {
      // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen());print('Exception in get request api service --> $err');
      CustomSnackBar.failedSnackBar(
          context: context, message: 'EXCEPTION --> $err');
      return null;
    }
  }
}
