import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';

class DeleteFromCartService {
  Future deleteFromCartService(
      {required BuildContext context,
      required String ticketId,
      required int id}) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          // url: deleteFromCart + '$ticketId' + '$id', context: context);
          url: deleteFromCart + "?id=$id&ticketId=$ticketId", context: context);

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
