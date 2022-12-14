import 'package:abc_cash_and_carry/models/payment_methods_model.dart';
import 'package:abc_cash_and_carry/providers/payment_methods_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PaymentMethodsServices {
  Future getPaymentMethods(BuildContext context) async {
    Map<String, dynamic> response = {
      "status": 1,
      "message": "success",
      "data": [
        {
          "payment_method_name": "paypal",
          "payment_method_image":
              "https://w1.pngwing.com/pngs/138/644/png-transparent-paypal-logo-text-line-blue.png",
          "payment_method_id": "1"
        },
        {
          "payment_method_name": "payoneer",
          "payment_method_image":
              "https://www.kasareviews.com/wp-content/uploads/2021/05/payoneer-review.jpg",
          "payment_method_id": "1"
        },
        {
          "payment_method_name": "stripe",
          "payment_method_image":
              "https://cdn.learnwoo.com/wp-content/uploads/2016/11/Payment-Gateway_Stripe.png",
          "payment_method_id": "1"
        },
        {
          "payment_method_name": "visa",
          "payment_method_image":
              "https://pngimg.com/uploads/visa/visa_PNG11.png",
          "payment_method_id": "1"
        },
        {
          "payment_method_name": "American Express",
          "payment_method_image":
              "https://mygoodknife.com/wp-content/uploads/American-Express-copy.png",
          "payment_method_id": "1"
        }
      ]
    };

    PaymentMethodsModel paymentMethodsModel =
        PaymentMethodsModel.fromJson(response);

    Provider.of<PaymentMethodsProvider>(context, listen: false)
        .updatePaymentMethods(newMethods: paymentMethodsModel.data);

    return true;
  }
}
