import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/data/all_resturant.dart';

import 'package:food/model/resturant_model.dart';
import 'package:food/screens/resturant_details.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomResturant extends StatefulWidget {
  const CustomResturant({super.key});

  @override
  State<CustomResturant> createState() => _CustomResturantState();
}

class _CustomResturantState extends State<CustomResturant> {
  final List<Restaurant> dummyRes = dummyRestaurants;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 400,
        child: ListView.builder(
          itemCount: dummyRes.length,
          itemBuilder: (context, index) {
            final data = dummyRes[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RestaurantDetailsScreen(restaurant: data),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(data.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  data.name,
                  style: GoogleFonts.sen(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),

                Text(
                  data.category,
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
                        Icon(Icons.star_border, color: AppColors.btn, size: 30),
                        SizedBox(width: 10),
                        Text(
                          data.rating.toString(),
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
                        Icon(Icons.access_time, color: AppColors.btn, size: 30),
                        SizedBox(width: 10),
                        Text(
                          data.deliveryTime,
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
            );
          },
        ),
      ),
    );
  }
}
