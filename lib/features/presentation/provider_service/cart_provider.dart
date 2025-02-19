import 'package:flutter/cupertino.dart';
import 'package:shopping/data/models/model.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];
  final Map<Product, int> quantities = {};

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    if (quantities.containsKey(product)) {
      quantities[product] = quantities[product]! + 1;
    } else {
      _cartItems.add(product);
      quantities[product] = 1;
    }
    notifyListeners();
  }

  void updateQundity(Product product, int newQty) {
    if (quantities.containsKey(product)) {
      quantities[product] = newQty;
      notifyListeners();
    }
  }

  void removeCart(Product product) {
    _cartItems.remove(product);
    quantities.remove(product);
    notifyListeners();
  }
}
