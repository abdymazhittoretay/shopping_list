import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Bamboo Desk Organizer", 29.99],
    ["Smart LED Strip Lights", 49.99],
    ["Wireless Bluetooth Earbuds", 79.99],
    ["Portable Espresso Maker", 99.99],
  ];

  get shopItems => _shopItems;

  final List _cartItems = [];

  get cartItems => _cartItems;

  void addItem(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void deleteItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String totalPrice() {
    double total = 0;
    for (var i = 0; i < cartItems.length; i++) {
      total += cartItems[i][1];
    }
    return total.toStringAsFixed(2);
  }
}
