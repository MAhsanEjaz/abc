import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';

class ProfileUpdateService {
  Future profileUpdateService(
      {required BuildContext context,
      String? phone,
      String? email,
      String? ownerAddress,
      String? fullName,
      int? id}) async {
    Map body = {
      "phone": phone,
      "email": email,
      "ownerAddress": ownerAddress,
      "fullName": fullName,
      "userId": id,
    };

    // try {
    var res = await PostRequestService().httpPostRequest(
        url: updateCustomerDataUrl + '$id', body: body, context: context);
    if (res == null && res != 1) {
      return false;
    } else {
      return true;
    }
    // } catch (err) {
    //   print(err);
    //   return false;
    // }
  }
}
