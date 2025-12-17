import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "My Address",
                    style: GoogleFonts.sen(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Adresss(
              title: 'HOME',
              icon: Icons.home,
              subtitle: '2462 Royal Ln. Mesa, New jersey\n45463',
            ),
            SizedBox(height: 20),
            Adresss(
              title: 'WORK',
              icon: Icons.work,
              subtitle: '3891 Ranchview Dr. Richardson,\nCalifornia 62639',
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.btn,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "ADD NEW ADDRESS",
                  style: GoogleFonts.sen(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Adresss extends StatelessWidget {
  final String title;
  final String subtitle;

  final IconData icon;
  const Adresss({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(icon),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.sen(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: GoogleFonts.sen(
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkgrey,
                    ),
                  ),

                  // Text(
                  //   pobox,
                  //   style: GoogleFonts.sen(
                  //     fontWeight: FontWeight.w400,
                  //     color: AppColors.darkgrey,
                  //   ),
                  // ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.edit, color: AppColors.btn),
                  SizedBox(width: 10),
                  Icon(Icons.delete, color: AppColors.btn),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
