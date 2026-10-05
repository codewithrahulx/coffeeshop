import 'package:flutter/foundation.dart';

import '../data/coffee_data.dart';
import '../models/coffee.dart';

class CartItem {
  final Coffee coffee;
  final String size;
  int qty;
  CartItem({required this.coffee, required this.size, this.qty = 1});

  double get unitPrice => AppState.priceFor(coffee, size);
  double get total => unitPrice * qty;
}

class AppState extends ChangeNotifier {
  static const Map<String, double> sizeExtra = {'S': -0.5, 'M': 0.0, 'L': 0.75};
  static double priceFor(Coffee c, String size) => c.price + sizeExtra[size]!;

  final Set<int> _favIds = {};
  final List<CartItem> _cart = [];

  List<CartItem> get cart => List.unmodifiable(_cart);
  int get cartCount => _cart.fold(0, (sum, i) => sum + i.qty);
  double get cartTotal => _cart.fold(0.0, (sum, i) => sum + i.total);
  List<Coffee> get favorites =>
      coffeeList.where((c) => _favIds.contains(c.id)).toList();

  bool isFav(int id) => _favIds.contains(id);

  void toggleFav(int id) {
    if (_favIds.contains(id)) {
      _favIds.remove(id);
    } else {
      _favIds.add(id);
    }
    notifyListeners();
  }

  void addToCart(Coffee coffee, String size) {
    final index = _cart.indexWhere(
      (i) => i.coffee.id == coffee.id && i.size == size,
    );
    if (index >= 0) {
      _cart[index].qty++;
    } else {
      _cart.add(CartItem(coffee: coffee, size: size));
    }
    notifyListeners();
  }

  void changeQty(CartItem item, int delta) {
    item.qty += delta;
    if (item.qty <= 0) _cart.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
