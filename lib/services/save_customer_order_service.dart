import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';

class SaveCustomerOrderService {
  Future saveCustomerOrderService(
      {required BuildContext context,
      int? userId,
      String? ticketId,
      String? customerName,
      String? orderAmount,
      String? billingAddress,
      String? phone,
      String? email,
      String? city,
      String? zipCode}) async {
    Map body = {
      "userId": userId,
      "ticketId": ticketId,
      "customerName": customerName,
      "orderAmount": orderAmount,
      "billingAddress": billingAddress,
      "phone": phone,
      "email": email,
      "adminStatus": false,
      "delivered": false,
      "IsPulled": false,
      "IsInvoiced": false,
      "IsRejected": false,
      "city": city,
      "zipCode": zipCode,
    };

    try {
      var res = await PostRequestService().httpPostRequest(
          url: saveCustomerOrder, body: body, context: context);

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
