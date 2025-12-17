import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/data/all_products.dart';
import 'package:food/model/resturant_model.dart';
import 'package:food/provider/food_provider.dart';
import 'package:food/screens/filter_screen.dart';

import 'package:food/widgets/product_card.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantDetailsScreen({super.key, required this.restaurant});

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  List<String> recentKeywords = ["Burger", "Sandwich", "Pizza", "Hotdog"];
  String selectedKeyword = "Burger";

  List filteredFoods = [];

  void selectRecentKeyword(String keyword) {
    final foods = Provider.of<FoodProvider>(context, listen: false).foods;

    setState(() {
      selectedKeyword = keyword;
      filteredFoods = foods.where((food) => food.category == keyword).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;
    final foodProvider = Provider.of<FoodProvider>(context);

    final allFoods = foodProvider.foods;
    final loading = foodProvider.isLoading;

    if (loading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (filteredFoods.isEmpty) {
      filteredFoods = allFoods
          .where((food) => food.category == selectedKeyword)
          .toList();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    Text(
                      "Resturant View",
                      style: GoogleFonts.sen(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.grey,
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  showGeneralDialog(
                                    context: context,
                                    barrierLabel: "Filter Menu",

                                    barrierDismissible: true,
                                    barrierColor: Colors.black38,
                                    transitionDuration: Duration(
                                      milliseconds: 300,
                                    ),
                                    pageBuilder: (_, __, ___) {
                                      return Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.75,
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.85,

                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(25),
                                            ),
                                          ),
                                          child: FilterScreen(),
                                        ),
                                      );
                                    },
                                    transitionBuilder: (_, anim, __, child) {
                                      return SlideTransition(
                                        position: Tween(
                                          begin: Offset(1, 0),
                                          end: Offset(0, 0),
                                        ).animate(anim),
                                        child: child,
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.more_horiz_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(restaurant.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      restaurant.name,
                      style: GoogleFonts.sen(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),

                    Text(
                      restaurant.category,
                      style: GoogleFonts.sen(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.darkgrey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_border,
                              color: AppColors.btn,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              restaurant.rating.toString(),
                              style: GoogleFonts.sen(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.darkgrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.local_shipping_outlined,
                              color: AppColors.btn,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Free",
                              style: GoogleFonts.sen(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.darkgrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: AppColors.btn,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              restaurant.deliveryTime,
                              style: GoogleFonts.sen(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.darkgrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: recentKeywords.map((word) {
                    return GestureDetector(
                      onTap: () => selectRecentKeyword(word),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          word,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                Text(
                  "$selectedKeyword (${filteredFoods.length})",
                  style: GoogleFonts.sen(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),

                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                  ),
                  itemCount: filteredFoods.length,
                  itemBuilder: (context, index) {
                    final food = filteredFoods[index];
                    return ProductCard(products: [food]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
