import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/provider/cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomAppB extends StatelessWidget {
  const CustomAppB({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              "Search",
              style: GoogleFonts.sen(fontWeight: FontWeight.w600, fontSize: 20),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 160.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.black,
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
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
