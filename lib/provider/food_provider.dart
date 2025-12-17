import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/model/food_model.dart';

class FoodProvider extends ChangeNotifier {
  List<Food> _foods = [];
  bool _isLoading = true;

  List<Food> get foods => _foods;
  bool get isLoading => _isLoading;

  FoodProvider() {
    fetchFoods();
  }

  Future<void> fetchFoods() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('food')
          .get();

      _foods = snapshot.docs.map((doc) {
        final data = doc.data();

        return Food(
          category: data['category'],
          name: data['name'],
          image: data['image'],
          price: data['price']?.toDouble(),
          rating: data['rating']?.toDouble(),
          size: List<int>.from(data['size']),
          description: data['description'],
          deliveryTime: data['deliveryTime'],
          restaurantName: data['restaurantName'],
          isPopular: data['isPopular'] ?? false,
          isRecommended: data['isRecommended'] ?? false,
        );
      }).toList();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print("ERROR FETCHING FOODS: $e");
      _isLoading = false;
      notifyListeners();
    }
  }
}
