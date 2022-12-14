import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/get_order_model.dart';
import 'package:abc_cash_and_carry/providers/order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OrderService {
  Future getOrderService({required BuildContext context,int? id}) async {
    try {
      var res = await GetRequestService()
          .httpGetRequest(url: getOrders + '$id' , context: context);

      if (res != null) {
        GetOrdersModel getOrdersModel = GetOrdersModel.fromJson(res);
        Provider.of<OrderProvider>(context, listen: false)
            .getOrder(newOrderModel: getOrdersModel.data);
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
