import 'package:abc_cash_and_carry/config/api_urls.dart';
import 'package:abc_cash_and_carry/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';

class AddItemIntoCartServiceWithApi {
  Future addToCartService({
    required BuildContext context,
    String? id,
    String? userId,
    String? productCode,
    String? name,
    String? imagePath,
    String? ticketId,
    String? retail,
    String? total,
    // String? OrderDate,
    String? CardTax,
    int? quantity,
  }) async {
    Map body = {
      "id": id,
      "userId": userId,
      "ticketId": ticketId,
      "productCode": productCode,
      "name": name,
      "imagePath": imagePath,
      "CardTax": CardTax,
      "retail": retail,
      "total": total,
      // "OrderDate": OrderDate,
      "quantity": quantity,
      "pendingForApproval": true,
      "isDelivered": false
    };

    try {
      var res = await PostRequestService()
          .httpPostRequest(url: addToCart, body: body, context: context);
      if (res == null && res['status'] != 1) {
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
