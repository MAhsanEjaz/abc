import 'dart:convert';
import 'dart:developer';
import 'package:abc_cash_and_carry/helper_services/token_save_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'custom_error_dialogue.dart';
import 'custom_snackbar.dart';
import 'internet_connectivity_service.dart';

class PostRequestService {
  Future httpPostRequest(
      {required String url,
      required Map? body,
      required BuildContext context}) async {
    print('post request url -->$url');
    log('post request body -->$body');

    String? token = await LocalStorageService().getBearerToken(context);

    var headers = {
      "accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    };
    try {
      bool isConnected = await InternetCheckService.checkInternet();
      if (!isConnected) {
        CustomErrorDialogue.showDialogue(context: context);
        return null;
      }
      http.Response response = await http.post(Uri.parse(url),
          body: json.encode(body), headers: headers);

      print('post response status code -->${response.statusCode}');
      log('post request body -->${response.body}');

      var jsonDecoded = json.decode(response.body);

      if (jsonDecoded['status'] == null || jsonDecoded['status'] != 1) {
        CustomSnackBar.showSnackBar(
            context: context, message: jsonDecoded['message']);
        return null;
      } else {
        return jsonDecoded;
      }
    } catch (err) {
      print('Exception in post request api service --> $err');
      CustomSnackBar.failedSnackBar(
          context: context, message: 'EXCEPTION --> $err');
      return null;
    }
  }
}
