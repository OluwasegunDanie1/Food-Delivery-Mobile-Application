import 'package:flutter/material.dart';
import 'package:food/model/cart_item.dart';
import 'package:food/services/shared_preference.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> cart = [];

  CartProvider() {
    loadCart();
  }

  // -------- LOAD CART --------
  Future<void> loadCart() async {
    final data = await StorageService.loadList("cart");

    cart = data.map((json) => CartItem.fromJson(json)).toList();

    notifyListeners();
  }

  // -------- SAVE CART --------
  Future<void> saveCart() async {
    await StorageService.saveList("cart", cart.map((e) => e.toJson()).toList());
  }

  void addToCart(CartItem item) {
    // If item already exists
    final index = cart.indexWhere(
      (e) => e.name == item.name && e.size == item.size,
    );

    if (index != -1) {
      cart[index].quantity++;
    } else {
      cart.add(item);
    }

    notifyListeners();
  }

  void increment(int index) {
    cart[index].quantity++;
    notifyListeners();
  }

  void decrement(int index) {
    if (cart[index].quantity > 1) {
      cart[index].quantity--;
    } else {
      cart.removeAt(index);
    }
    notifyListeners();
  }

  void removeItem(int index) {
    cart.removeAt(index);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (var item in cart) {
      total += item.price * item.quantity;
    }
    return total;
  }

  int get totalItems {
    int total = 0;
    for (var item in cart) {
      total += item.quantity;
    }
    return total;
  }
}
