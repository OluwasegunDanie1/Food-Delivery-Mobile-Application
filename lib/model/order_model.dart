import 'package:food/model/food_model.dart';

class OrderModel {
  final String orderId;
  final Food food;
  final DateTime date;
  String status;

  OrderModel({
    required this.orderId,
    required this.food,
    required this.date,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "orderId": orderId,
      "food": food.toJson(),
      "date": date.toIso8601String(),
      "status": status,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json["orderId"],
      food: Food.fromJson(json["food"]),
      date: DateTime.parse(json["date"]),
      status: json["status"],
    );
  }
}
