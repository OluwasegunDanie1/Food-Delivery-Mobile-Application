import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/provider/user_provider.dart';
import 'package:food/screens/myaddress.dart';
import 'package:food/screens/personal_info_screen.dart';
import 'package:food/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void logout() {
    final authService = AuthService();
    authService.logout();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: _circleButton(Icons.arrow_back_ios_new_rounded),
                  ),
                  Text(
                    "Profile",
                    style: GoogleFonts.sen(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  _circleButton(Icons.more_horiz),
                ],
              ),

              const SizedBox(height: 25),

              // User Profile details
              Row(
                children: [
                  const CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage("images/person.png"),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: GoogleFonts.sen(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        user.bio,
                        style: GoogleFonts.sen(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Section 1
              _menuSection([
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalInfoScreen(),
                      ),
                    );
                  },
                  child: _menuItem(
                    Icons.person_outline,
                    "Personal Info",
                    Colors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyAddressScreen(),
                      ),
                    );
                  },
                  child: _menuItem(
                    Icons.map_outlined,
                    "Addresses",
                    Colors.blue,
                  ),
                ),
              ]),

              const SizedBox(height: 25),

              //  Section 2
              _menuSection([
                _menuItem(
                  Icons.shopping_bag_outlined,
                  "Cart",
                  Colors.lightBlue,
                ),
                _menuItem(Icons.favorite_border, "Favourite", Colors.pink),
                _menuItem(
                  Icons.notifications_outlined,
                  "Notifications",
                  Colors.amber,
                ),
                _menuItem(Icons.credit_card, "Payment Method", Colors.indigo),
              ]),

              const SizedBox(height: 25),

              // Section 3
              _menuSection([
                _menuItem(Icons.help_outline, "FAQs", Colors.deepOrange),
                _menuItem(Icons.reviews_outlined, "User Reviews", Colors.teal),
                _menuItem(
                  Icons.settings_outlined,
                  "Settings",
                  Colors.deepPurple,
                ),
              ]),

              const SizedBox(height: 25),

              //  Logout
              _menuSection([
                GestureDetector(
                  onTap: logout,
                  child: _menuItem(
                    Icons.logout,
                    "Log Out",
                    Colors.red,
                    danger: false,
                  ),
                ),
              ]),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  //  Circle button (Back / More)
  Widget _circleButton(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(icon, size: 20, color: Colors.black87),
    );
  }

  //  Section Container
  Widget _menuSection(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  //  Menu item row
  Widget _menuItem(
    IconData icon,
    String title,
    Color iconColor, {
    bool danger = false,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: GoogleFonts.sen(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: danger ? AppColors.btn : Colors.black,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}
