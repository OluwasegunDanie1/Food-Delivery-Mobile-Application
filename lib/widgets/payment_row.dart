import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentRow extends StatefulWidget {
  const PaymentRow({super.key});

  @override
  State<PaymentRow> createState() => _PaymentRowState();
}

class _PaymentRowState extends State<PaymentRow> {
  final List<Map<String, dynamic>> payrow = [
    {"title": "Cash", "image": "images/cash.png"},
    {"title": "Visa", "image": "images/visa.png"},
    {"title": "MasterCard", "image": "images/mastercard.png"},
    {"title": "PayPal", "image": "images/paypal.png"},
  ];
  late dynamic selectedCard;

  @override
  void initState() {
    super.initState();
    selectedCard = payrow[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: payrow.length,
        itemBuilder: (BuildContext context, int index) {
          final data = payrow[index];
          bool isSelected = selectedCard == data;
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard = data;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: 90,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(15),
                          border: isSelected
                              ? Border.all(color: AppColors.btn, width: 2)
                              : null,
                        ),
                        child: Image.asset(data["image"]),
                      ),
                      isSelected
                          ? Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.btn,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 20,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                Text(data["title"], style: GoogleFonts.sen()),
                // SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
