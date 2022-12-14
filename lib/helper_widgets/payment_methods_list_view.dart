import 'package:abc_cash_and_carry/helper_widgets/payment_method_card.dart';
import 'package:abc_cash_and_carry/providers/payment_methods_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodsListView extends StatefulWidget {
  @override
  _PaymentMethodsListViewState createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {


  int selectedIndex = 1500;
  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentMethodsProvider>(builder: (context, methods, _) {
      return SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount: methods.paymentMethods!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: PaymentMethodCard(
                      paymentMethod: methods.paymentMethods![index], color: (selectedIndex == index)?  Colors.blueGrey: Colors.white, selected: (selectedIndex == index)? true : false,),
                ),
              );
            }),
      );
    });
  }
}
