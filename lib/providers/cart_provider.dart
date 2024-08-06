import 'package:flutter/material.dart';
import 'package:traveler_provider/data/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    final index = _items.indexWhere((cartItem) => cartItem.id == item.id);
    if (index >= 0) {
      _items[index] = CartItem(
        id: item.id,
        title: item.title,
        quantity: _items[index].quantity + 1,
      );
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(int id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}