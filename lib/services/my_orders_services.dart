import 'package:abc_cash_and_carry/models/my_order_model.dart';
import 'package:abc_cash_and_carry/providers/my_orders_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyOrdersServices {
  // Future getMyOrdrs({required BuildContext context, required List<CartItemModel>? myOrders}) async {
  //   Map body = {'id': 'myid'};
  //   try {
  //   //  var res = await PostRequestService().httpPostRequest(url: getMyOrdersUrl, body: body, context: context);
  //   //  if (res != null) {
  //
  //       Provider.of<MyOrdersProvider>(context, listen: false).addToMyOrdersList(newOrders: myOrders);
  //       // provider data storage
  //       // remember user logged in
  //
  //       return true;
  //   //  } else {
  //    //   return false;
  //     //}
  //   } catch (err) {
  //     print('exception in getMyOrdrs --> $err');
  //     return false;
  //   }
  // }


  // Future addToMyOrdrs({required BuildContext context, required MyOrderModel? myOrder}) async {
  //   try {
  //       Provider.of<MyOrdersProvider>(context, listen: false).addToMyOrdersList(newOrder: myOrder);
  //       print('addition order into provider success');
  //       return true;
  //   } catch (err) {
  //     print('exception in getMyOrdrs --> $err');
  //     return false;
  //   }
  // }

}
