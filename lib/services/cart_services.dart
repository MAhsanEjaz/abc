import 'package:abc_cash_and_carry/helper_services/custom_get_request_service.dart';
import 'package:abc_cash_and_carry/models/cart_model.dart';
import 'package:abc_cash_and_carry/providers/cart_items_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../config/api_urls.dart';

class CartServices {
  Future getCartItems({required BuildContext context, required int id}) async {
    try {
      var res = await GetRequestService()
          .httpGetRequest(url: getCart + '$id', context: context);

      if (res != null) {
        CartResponseModel cartItemModel = CartResponseModel.fromJson(res);
        Provider.of<CartItemsProvider>(context, listen: false)
            .addCartItems(newCartItem: cartItemModel.data!);
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
