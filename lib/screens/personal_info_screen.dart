import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/provider/user_provider.dart';
import 'package:food/screens/edit_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _roundButton(Icons.arrow_back_ios, () {
                    Navigator.pop(context);
                  }),
                  Text(
                    "Personal Info",
                    style: GoogleFonts.sen(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "EDIT",
                      style: GoogleFonts.sen(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// PROFILE PHOTO & NAME
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/person.png"),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.name,
                      style: GoogleFonts.sen(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      user.bio,
                      style: GoogleFonts.sen(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// INFO CARD
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    _infoTile(Icons.person_outline, "FULL NAME", user.name),
                    const SizedBox(height: 20),

                    _infoTile(Icons.email_outlined, "EMAIL", user.email),
                    const SizedBox(height: 20),

                    _infoTile(Icons.phone_outlined, "PHONE NUMBER", user.phone),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roundButton(IconData icon, VoidCallback onTap) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(color: AppColors.grey, shape: BoxShape.circle),
      child: IconButton(icon: Icon(icon, size: 20), onPressed: onTap),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.btn),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.sen(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: GoogleFonts.sen(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
