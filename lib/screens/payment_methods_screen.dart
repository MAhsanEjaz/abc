import 'package:abc_cash_and_carry/helper_widgets/payment_methods_list_view.dart';
import 'package:abc_cash_and_carry/services/payment_methods_services.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatefulWidget {
  @override
  _PaymentMethodsScreenState createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {


  _getPaymentMethods() {
    PaymentMethodsServices().getPaymentMethods(context);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getPaymentMethods();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Payment methods'),
            ),
            PaymentMethodsListView(),
          ],),
    );
  }
}
