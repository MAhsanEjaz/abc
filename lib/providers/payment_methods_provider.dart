import 'package:abc_cash_and_carry/models/payment_methods_model.dart';
import 'package:flutter/material.dart';

class PaymentMethodsProvider extends ChangeNotifier {
  List<PaymentMethodModel>? paymentMethods = [];

  updatePaymentMethods({List<PaymentMethodModel>? newMethods}) {
    paymentMethods = newMethods;
    notifyListeners();
  }
}
