import 'package:flutter/material.dart';
import 'package:food/model/cart_item.dart';
import 'package:food/model/food_model.dart';
import 'package:food/model/order_model.dart';
import 'package:food/provider/cart_provider.dart';
import 'package:food/services/shared_preference.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];

  OrderProvider() {
    loadOrders();
  }

  // -------- LOAD ORDERS --------
  Future<void> loadOrders() async {
    final data = await StorageService.loadList("orders");

    _orders = data.map((json) => OrderModel.fromJson(json)).toList();
    notifyListeners();
  }

  // -------- SAVE ORDERS --------
  Future<void> saveOrders() async {
    await StorageService.saveList(
      "orders",
      _orders.map((e) => e.toJson()).toList(),
    );
  }

  List<OrderModel> get ongoing =>
      _orders.where((o) => o.status == "ongoing").toList();

  List<OrderModel> get history =>
      _orders.where((o) => o.status != "ongoing").toList();

  void createOrder(Food food) {
    _orders.add(
      OrderModel(
        orderId: DateTime.now().millisecondsSinceEpoch.toString(),
        food: food,
        date: DateTime.now(),
        status: "ongoing",
      ),
    );
    notifyListeners();
  }

  void placeOrder(List<CartItem> cart, CartProvider cartProvider) {
    if (cart.isEmpty) return;

    for (var item in cart) {
      _orders.add(
        OrderModel(
          orderId: DateTime.now().millisecondsSinceEpoch.toString(),
          food: Food(
            name: item.name,
            price: item.price,
            image: item.image,
            description: "",
            restaurantName: "",
            deliveryTime: "",
            rating: 0,
            size: [int.parse(item.size)],
            category: '',
          ),
          date: DateTime.now(),
          status: "ongoing",
        ),
      );
    }

    saveOrders();
    cartProvider.cart.clear();
    cartProvider.notifyListeners();

    notifyListeners();
  }

  void cancelOrder(String id) {
    final order = _orders.firstWhere((o) => o.orderId == id);
    order.status = "cancelled";
    notifyListeners();
  }

  void completeOrder(String id) {
    final order = _orders.firstWhere((o) => o.orderId == id);
    order.status = "completed";
    notifyListeners();
  }
}
