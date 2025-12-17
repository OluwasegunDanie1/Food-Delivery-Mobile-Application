import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/provider/cart_provider.dart';
import 'package:food/provider/user_provider.dart';
import 'package:food/screens/cart_screen.dart';
import 'package:food/screens/food_screen.dart';

import 'package:food/widgets/custom_category_card.dart';
import 'package:food/widgets/custom_text_field.dart';
import 'package:food/widgets/resturant_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.grey,
                    ),
                    child: Image.asset("images/Icon.png"),
                  ),
                  title: Text(
                    "DELIVER TO",
                    style: TextStyle(
                      color: AppColors.btn,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text("Halal Lab office"),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  trailing: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.darkgrey,
                    ),
                    child: Consumer<CartProvider>(
                      builder: (context, cart, child) {
                        return Badge(
                          backgroundColor: AppColors.btn,
                          label: Text(
                            cart.totalItems.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          largeSize: 30,

                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //greetings
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: RichText(
                    text: TextSpan(
                      text: user.name + ",",
                      style: GoogleFonts.sen(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: " Good Afternoon!",
                          style: GoogleFonts.sen(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //search bar
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: CustomTextField(
                    title: "",
                    hinttext: "Search dishes, resturants",
                    icon: Icons.search,
                  ),
                ),
                SizedBox(height: 10),
                //categories
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Categories",
                        style: GoogleFonts.sen(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "See All",
                            style: GoogleFonts.sen(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FoodScreen(),
                                ),
                              );
                            },
                            child: Icon(Icons.arrow_forward_ios, size: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                CustomCategoryCard(),

                //resturant section
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Open Resturants",
                        style: GoogleFonts.sen(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "See All",
                            style: GoogleFonts.sen(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_ios, size: 20),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomResturant(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
