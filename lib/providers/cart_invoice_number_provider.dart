import 'package:abc_cash_and_carry/models/cart_invoice_number_model.dart';
import 'package:flutter/cupertino.dart';

class CartInvoiceNumberProvider extends ChangeNotifier {
  String? cartInvoiceNumber;

  updateCartInvoiceNumber({String? newCartInvoiceNumberModel}) {
    cartInvoiceNumber = newCartInvoiceNumberModel;
    notifyListeners();
  }
}
