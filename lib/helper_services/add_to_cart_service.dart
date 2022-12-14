import 'package:abc_cash_and_carry/helper_services/custom_loader.dart';
import 'package:abc_cash_and_carry/models/inventory_item_get_model.dart';
import 'package:abc_cash_and_carry/providers/cart_invoice_number_provider.dart';
import 'package:abc_cash_and_carry/providers/user_data_provider.dart';
import 'package:abc_cash_and_carry/services/add_item_into_cart_service.dart';
import 'package:abc_cash_and_carry/services/cart_invoice_number_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../providers/cart_items_provider.dart';
import 'custom_snackbar.dart';

class AddToCartService {
  static Future<bool> addItemToCart(
      {required ProductModel product,
      required BuildContext context,
      required int quantity}) async {
    try {
      String? ticketId =
          Provider.of<CartInvoiceNumberProvider>(context, listen: false)
              .cartInvoiceNumber;

      if (ticketId == null) {
        await CartInvoiceNumberService()
            .cartInvoiceNumberService(context: context);
        ticketId =
            Provider.of<CartInvoiceNumberProvider>(context, listen: false)
                .cartInvoiceNumber;
      }
      int userId =
          Provider.of<UserDataProvider>(context, listen: false).user!.data!.id!;
      CartItemModel cartItem = CartItemModel(
          userId: userId,
          name: product.name,
          id: product.id,
          productCode: product.productCode,
          retail: product.retail,
          ticketId: ticketId,
          imagePath: product.itemImage,
          totalPrice: double.parse(product.retail!) * quantity,
          quantity: quantity);

      CustomLoader.showLoader(context: context);

      await AddItemIntoCartServiceWithApi().addToCartService(
          context: context,
          quantity: quantity,
          name: product.name,
          ticketId:
              Provider.of<CartInvoiceNumberProvider>(context, listen: false)
                  .cartInvoiceNumber,
          // OrderDate: '${DateTime.now().year}-0${DateTime.now().month}-${DateTime.now().day}',
          id: product.id.toString(),
          imagePath: product.itemImage,
          productCode: product.productCode,
          retail: product.retail,
          total: (double.parse(product.retail!) * quantity).toString(),
          userId: userId.toString());

      Provider.of<CartItemsProvider>(context, listen: false)
          .addNewCartItem(newCartItem: cartItem);
      CustomLoader.hideLoader(context);

      CustomSnackBar.showSnackBar(
          context: context, message: '${product.name} added to cart');

      return true;
    } catch (err) {
      print('exception add to cart $err');
      return false;
    }
  }
}

// '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}-${TimeOfDay.now()}',
