import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';

class IncreamentItemInCartService {
  Future increamentItemInCart(
      {required BuildContext context, int? id, String? ticketId}) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          url: addItemInCartUrl + '?id=$id&ticketId=$ticketId',
          context: context);

      if (res != null) {
        return false;
      } else {
        return true;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }
}
