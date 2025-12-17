import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/data/all_resturant.dart';
import 'package:food/data/all_products.dart';
import 'package:food/model/food_model.dart';
import 'package:food/provider/food_provider.dart';
import 'package:food/widgets/custom_app_bar.dart';

import 'package:food/widgets/custom_text_field.dart';
import 'package:food/widgets/product_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String searchText = "";

  List<String> recentKeywords = ["Burger", "Sandwich", "Pizza", "Hotdog"];

  List filteredRestaurants = [];
  List filteredFoods = [];

  @override
  void initState() {
    super.initState();

    // Restaurants remain dummy
    filteredRestaurants = dummyRestaurants;

    // Foods from provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final foods = context.read<FoodProvider>().foods;
      setState(() => filteredFoods = foods);
    });
  }

  void filterResults() {
    final foods = context.read<FoodProvider>().foods;

    // FILTER RESTAURANTS (dummy)
    filteredRestaurants = dummyRestaurants
        .where(
          (rest) => rest.name.toLowerCase().contains(searchText.toLowerCase()),
        )
        .toList();

    // FILTER FOODS (from Firestore)
    filteredFoods = foods
        .where(
          (food) =>
              food.name.toLowerCase().contains(searchText.toLowerCase()) ||
              food.category.toLowerCase().contains(searchText.toLowerCase()),
        )
        .toList();

    setState(() {});
  }

  void onSearchChanged(String value) {
    setState(() => searchText = value);
    filterResults();
  }

  void selectRecentKeyword(String word) {
    setState(() {
      searchController.text = word;
      searchText = word;
    });
    filterResults();
  }

  @override
  Widget build(BuildContext context) {
    final foodProvider = context.watch<FoodProvider>();

    if (foodProvider.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(color: AppColors.btn)),
      );
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
                CustomAppB(),

                /// SEARCH FIELD
                CustomTextField(
                  title: '',
                  controller: searchController,
                  icon: Icons.search,
                  hinttext: "Pizza",
                  onChanged: onSearchChanged,
                ),

                const SizedBox(height: 15),

                /// RECENT KEYWORDS
                Text(
                  "Recent Keyword",
                  style: GoogleFonts.sen(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
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

                const SizedBox(height: 20),

                /// RESULTS COUNT
                Text(
                  "Found ${filteredFoods.length + filteredRestaurants.length} results",
                  style: GoogleFonts.sen(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  "Suggested Resturants",
                  style: GoogleFonts.sen(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),

                /// DISPLAY SEARCH RESULTS
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredRestaurants.length,
                  itemBuilder: (context, index) {
                    final rest = filteredRestaurants[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          rest.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(rest.name),
                      subtitle: Row(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            color: AppColors.btn,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            rest.rating.toString(),
                            style: GoogleFonts.sen(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Popular Fast Food",
                  style: GoogleFonts.sen(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                ProductCard(products: filteredFoods.cast<Food>()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
