import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';

import 'package:food/provider/card_provider.dart';
import 'package:food/screens/add_card_screen.dart';
import 'package:food/screens/delivery_progress_page.dart';
import 'package:food/widgets/payment_row.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class PayConfirmScreen extends StatelessWidget {
  const PayConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    String maskCardNumber(String number) {
      if (number.length < 2) return "****";
      String lastthree = number.substring(number.length - 3);
      return "**** **** **** *$lastthree";
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20, top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Payment",
                    style: GoogleFonts.sen(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              PaymentRow(),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 135,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Consumer<CardProvider>(
                    builder: (context, cardProvider, child) {
                      final card = cardProvider.cardInfo;
                      if (card == null) {
                        return Text("No card added yet");
                      }

                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Master Card",
                              style: GoogleFonts.sen(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset("images/mastercard.png"),
                                SizedBox(width: 5),
                                Text(maskCardNumber(card.cardNumber)),
                                SizedBox(width: 120),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              card.cardHolderName,
                              style: GoogleFonts.sen(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.btn,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: AppColors.grey, width: 1.5),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCardScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: AppColors.btn, size: 30),
                      SizedBox(width: 10),
                      Text(
                        "ADD NEW",
                        style: GoogleFonts.sen(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 200),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TOTAL:", style: GoogleFonts.sen(fontSize: 18)),
                    Text(
                      "\$${cartProvider.totalPrice.toStringAsFixed(2)}",
                      style: GoogleFonts.sen(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.btn,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeliveryProgressPage(),
                      ),
                    );
                  },
                  child: Text(
                    "PAY & CONFIRM",
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
      ),
    );
  }
}
