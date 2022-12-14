import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/new_previous_order_model.dart';
import 'package:abc_cash_and_carry/providers/new_previous_order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PreviousOrderService {
  Future previousOrderService(
      {required BuildContext context, int? userId}) async {
    try {
      var res = await GetRequestService()
          .httpGetRequest(url: previousOrdersUrl+'$userId', context: context);

      if (res != null) {
        NewPrevousOrderModel newPreviousOrderModel =
            NewPrevousOrderModel.fromJson(res);

        Provider.of<NewPreviousOrderProvider>(context, listen: false)
            .getPreviousOrders(newPreviousOrders: newPreviousOrderModel.data);
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
