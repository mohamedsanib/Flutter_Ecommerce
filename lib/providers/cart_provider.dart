import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  double get totalPrice =>
      _cart.fold(0, (sum, item) => sum + item.price);
}
