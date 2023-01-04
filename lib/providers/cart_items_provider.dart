import 'package:abc_cash_and_carry/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartItemsProvider extends ChangeNotifier {
  List<CartItemModel>? cartItems = [];
  double totalCalculatedPrice = 0;

  addCartItems({List<CartItemModel>? newCartItem}) {
    cartItems = newCartItem;
    _totalCalculatedPrice();
    notifyListeners();
  }

  addNewCartItem({CartItemModel? newCartItem}) {
    for (int i = 0; i < cartItems!.length; i++) {
      if (cartItems![i].id == newCartItem!.id) {
        print(
            'product already found in cart : ${cartItems![i].id} ==  ${newCartItem.id}');
        cartItems![i].quantity++;
        cartItems![i].totalPrice =
            double.parse(cartItems![i].retail.toString()) *
                cartItems![i].quantity;

        _totalCalculatedPrice();
        notifyListeners();
        return;
      } else {
        print(
            'product not found in cart : ${cartItems![i].id} ==  ${newCartItem.id}');
        notifyListeners();
      }
    }

    cartItems!.add(newCartItem!);

    _totalCalculatedPrice();
    notifyListeners();
  }

  emptyCartItems() {
    cartItems = [];
    _totalCalculatedPrice();
    notifyListeners();
  }

  updateCartItems({required int index, required int qty}) {
    cartItems![index].quantity = qty;
    cartItems![index].totalPrice = qty *
        double.parse(
          cartItems![index].retail ?? '0',
        );
    _totalCalculatedPrice();
    notifyListeners();
  }

  deleteCartItems({required int index}) {
    cartItems!.removeAt(index);
    _totalCalculatedPrice();
    notifyListeners();
  }

  _totalCalculatedPrice() {
    double tempTotal = 0;
    cartItems!.forEach((element) {
      tempTotal = tempTotal + element.totalPrice!;
    });
    totalCalculatedPrice = tempTotal;
  }
}
