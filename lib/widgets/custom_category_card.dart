import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/screens/food_screen.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomCategoryCard extends StatefulWidget {
  const CustomCategoryCard({super.key});

  @override
  State<CustomCategoryCard> createState() => _CustomCategoryCardState();
}

class _CustomCategoryCardState extends State<CustomCategoryCard> {
  final List<Map<String, dynamic>> category = [
    {"name": "All", "image": "images/fire.png"},
    {"name": "Hot Dog", "image": "images/hot.png"},
    {"name": "Burger", "image": "images/burger1.png"},
    {"name": "Pizza", "image": "images/pizza.jpg"},
  ];

  late dynamic selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = category[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,

          itemBuilder: (BuildContext context, int index) {
            final data = category[index];

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = data;
                });
              },
              child: Container(
                width: 140,
                height: 30,
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 0.3,
                      offset: Offset(1, 2),
                    ),
                  ],
                  color: selectedIndex == data
                      ? Color(0xffFFD27C)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset(data["image"]),
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FoodScreen()),
                        );
                      },
                      child: Text(
                        data["name"],
                        style: GoogleFonts.sen(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
