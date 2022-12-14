import 'package:abc_cash_and_carry/models/payment_methods_model.dart';
import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  PaymentMethodModel paymentMethod;
  Color color;
  bool selected ;

  PaymentMethodCard({required this.paymentMethod, required this.color, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:5,
      color: color,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Image.network(paymentMethod.paymentMethodImage ?? '')),
          SizedBox(height: 10,),
          Text(paymentMethod.paymentMethodName ?? ''),
          selected ? Icon(Icons.radio_button_checked_sharp) : Icon(Icons.radio_button_off),
        ],
      ),
    );
  }
}
