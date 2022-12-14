import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';

class DeleteFullCartService {
  Future deleteFullCartService(
      {required BuildContext context, String? ticketId}) async {
    try {
      var res = GetRequestService().httpGetRequest(
          url: deleteCurrentCartItemUrl + '?ticketId=$ticketId',
          context: context);

      if (res != null) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }
}
