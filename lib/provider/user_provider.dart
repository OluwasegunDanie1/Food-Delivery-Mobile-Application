import 'package:flutter/material.dart';
import 'package:food/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  final AppUser _user = AppUser(
    name: "John Doe",
    email: "example@gmail.com",
    phone: "081******17",
    bio: "I Love Fast Food",
  );

  AppUser get user => _user;

  void updateUser({String? name, String? email, String? phone, String? bio}) {
    if (name != null) _user.name = name;
    if (email != null) _user.email = email;
    if (phone != null) _user.phone = phone;
    if (bio != null) _user.bio = bio;

    notifyListeners();
  }
}
