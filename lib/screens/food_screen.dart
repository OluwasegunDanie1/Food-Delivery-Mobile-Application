import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/data/all_products.dart';
import 'package:food/data/categories.dart';
import 'package:food/provider/food_provider.dart';
import 'package:food/screens/search_screen.dart';

import 'package:food/widgets/product_card.dart';
import 'package:food/widgets/resturant_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  String selectedCategory = "All";
  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);
    final foods = foodProvider.foods;

    if (foodProvider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    final filteredFoods = selectedCategory == "All"
        ? foods
        : foods.where((f) => f.category == selectedCategory).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //CustomAppBar(),
                //appbar
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 130,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: BoxBorder.all(
                          style: BorderStyle.solid,
                          color: AppColors.grey,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: DropdownButtonFormField<String>(
                        icon: Icon(Icons.arrow_drop_down, color: AppColors.btn),
                        initialValue: selectedCategory,
                        decoration: InputDecoration(
                          enabled: false,
                          iconColor: AppColors.btn,
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        items: categories.map((cat) {
                          return DropdownMenuItem(
                            value: cat,
                            child: Text(
                              cat,
                              style: GoogleFonts.sen(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreen(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(Icons.tune, size: 30),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  ("Popular $selectedCategory"),
                  style: GoogleFonts.sen(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 15),
                ProductCard(products: filteredFoods),
                SizedBox(height: 25),
                Text(
                  "Open Resturants",
                  style: GoogleFonts.sen(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                CustomResturant(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
