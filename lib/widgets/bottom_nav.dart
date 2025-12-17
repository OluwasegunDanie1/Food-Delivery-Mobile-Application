import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/screens/cart_screen.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/screens/my_order_screen.dart';
import 'package:food/screens/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedPage = 0;
  final screens = [
    HomeScreen(),
    CartScreen(),
    MyOrdersScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.btn,
        unselectedItemColor: AppColors.darkgrey,
        showUnselectedLabels: true,

        currentIndex: selectedPage,
        onTap: (index) => setState(() {
          selectedPage = index;
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_rounded),
            label: "My Order",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
