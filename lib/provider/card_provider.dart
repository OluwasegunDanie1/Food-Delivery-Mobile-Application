import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food/model/atm_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardProvider extends ChangeNotifier {
  CardInfo? cardInfo;

  CardProvider() {
    _loadCardFromStorage();
  }

  // SAVE CARD
  Future<void> setCard(CardInfo info) async {
    cardInfo = info;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    String jsonCard = jsonEncode(info.toJson());
    await prefs.setString("saved_card", jsonCard);
  }

  // LOAD CARD
  Future<void> _loadCardFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonCard = prefs.getString("saved_card");

    if (jsonCard != null) {
      Map<String, dynamic> data = jsonDecode(jsonCard);
      cardInfo = CardInfo.fromJson(data);
      notifyListeners();
    }
  }

  // DELETE CARD
  Future<void> removeCard() async {
    cardInfo = null;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("saved_card");
  }
}
