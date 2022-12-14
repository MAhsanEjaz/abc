import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/current_order_model.dart';
import 'package:abc_cash_and_carry/providers/current_order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/api_urls.dart';

class GetCurrentProductService {
  Future getCurrentProductService(
      {required BuildContext context, String? ticketId}) async {
    try {
      var res = await GetRequestService().httpGetRequest(
          url: getCurrentOrderByTicketId + '$ticketId', context: context);

      if (res != null) {
        CurrentOrderModel currentOrderModel = CurrentOrderModel.fromJson(res);
        Provider.of<CurrentOrderProvider>(context, listen: false)
            .getCurrentProduct(newCurrentModel: currentOrderModel.data);
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
