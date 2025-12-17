import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food/services/auth_service.dart';
import 'package:food/services/shared_preference.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  Future<void> register(String email, String password) async {
    _user = await _authService.register(email, password);
    if (_user != null) {
      await saveUserEmail(_user!.email!);
    }
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _user = await _authService.login(email, password);
    if (_user != null) {
      await saveUserEmail(_user!.email!);
    }
    notifyListeners();
  }

  Future<void> reset(String email) async {
    await _authService.reset(email);
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    _user = null;
    await clearUserEmail();
    notifyListeners();
  }
}
