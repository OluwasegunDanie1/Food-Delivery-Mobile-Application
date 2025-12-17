import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/model/cart_item.dart';
import 'package:food/model/food_model.dart';
import 'package:food/provider/cart_provider.dart';

import 'package:food/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Food food;

  const ProductDetailsScreen({super.key, required this.food});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int? selectedSize;
  int quantity = 1;

  void addToCart() {
    final item = CartItem(
      name: widget.food.name,
      price: widget.food.price,
      quantity: quantity,
      image: widget.food.image,
      size: (selectedSize ?? 14).toString(),
    );

    Provider.of<CartProvider>(context, listen: false).addToCart(item);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green[400],
        content: Text(
          "Added to cart",
          style: GoogleFonts.sen(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    final List<String> ingredients = [
      "images/Group 8213.png",
      "images/Group 8214.png",
      "images/Group 8215.png",
      "images/Group 8216.png",
      "images/Group 8217.png",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Details",
                    style: GoogleFonts.sen(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Center(child: Image.asset(food.image)),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    196,
                                    114,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      Container(
                        width: 220,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: AppColors.grey,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.favorite),
                            const SizedBox(width: 10),
                            Text(food.restaurantName),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        food.name,
                        style: GoogleFonts.sen(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        food.description,
                        style: GoogleFonts.sen(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star_border,
                                color: AppColors.btn,
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                food.rating.toString(),
                                style: GoogleFonts.sen(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.darkgrey,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 30),

                          Row(
                            children: [
                              Icon(
                                Icons.local_shipping_outlined,
                                color: AppColors.btn,
                                size: 30,
                              ),
                              const SizedBox(width: 10),
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

                          const SizedBox(width: 30),

                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: AppColors.btn,
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                food.deliveryTime,
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

                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Text("SIZE: ", style: GoogleFonts.sen()),
                          SizedBox(width: 10),
                          Wrap(
                            spacing: 8,
                            children: food.size!.map((s) {
                              final isSelected = selectedSize == s;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = s;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.btn
                                        : AppColors.grey,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    s.toString(),
                                    style: GoogleFonts.sen(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.black,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text("INGREDIENTS", style: GoogleFonts.sen()),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          ingredients.length,
                          (index) => Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ingredients[index]),
                              ),
                              color: AppColors.ing,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${(food.price * quantity).toString()}",
                                    style: GoogleFonts.sen(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: AppColors.darkgrey,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                if (quantity > 1) {
                                                  setState(() => quantity--);
                                                }
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            quantity.toString(),
                                            style: GoogleFonts.sen(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: AppColors.darkgrey,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() => quantity++);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              CustomButton(
                                title: "ADD TO CART",
                                onPressed: addToCart,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
