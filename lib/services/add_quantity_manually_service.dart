import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:flutter/cupertino.dart';

import '../config/api_urls.dart';

class AddQuantityManually {
  Future addQuantityManually(
      {required BuildContext context,
      int? id,
      String? quantity,
      String? ticketId}) async {
    try {
      var intQuantity = int.parse(quantity!);

      var res = await GetRequestService().httpGetRequest(
          url: addQuantityInTextField +
              '?id=$id&ticketId=$ticketId&quantity=$intQuantity',
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
