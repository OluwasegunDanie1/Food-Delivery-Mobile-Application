import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserEmail(String email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_email', email);
}

Future<String?> getUserEmail() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_email');
}

Future<void> clearUserEmail() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('user_email');
}

class StorageService {
  // -------- SAVE STRING LIST --------
  static Future<void> saveList(String key, List<dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> jsonList = data.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList(key, jsonList);
  }

  // -------- LOAD STRING LIST --------
  static Future<List<Map<String, dynamic>>> loadList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(key);

    if (saved == null) return [];

    return saved.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
  }

  // -------- REMOVE KEY --------
  static Future<void> clearKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
