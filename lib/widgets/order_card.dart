import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/screens/track_order_scree.dart';
import '../model/order_model.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final bool isHistory;

  const OrderCard({super.key, required this.order, required this.isHistory});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FOOD ROW
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  order.food.image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              // DETAILS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.food.name,
                      style: GoogleFonts.sen(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "\$${order.food.price.toStringAsFixed(2)}",
                      style: GoogleFonts.sen(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.btn,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Text(
                    //   order.food,
                    //   style: GoogleFonts.sen(color: Colors.grey, fontSize: 12),
                    // ),
                  ],
                ),
              ),

              Text(
                "#${order.orderId}",
                style: GoogleFonts.sen(color: Colors.blueGrey, fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // BUTTONS
          Row(
            children: [
              if (!isHistory)
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.btn,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrackOrderScreen(),
                        ),
                      );
                    },
                    child: const Text("Track Order"),
                  ),
                ),

              if (!isHistory) const SizedBox(width: 10),

              if (isHistory)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.btn),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Rate"),
                  ),
                ),

              const SizedBox(width: 10),

              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: isHistory ? AppColors.btn : Colors.red,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(isHistory ? "Re-Order" : "Cancel"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
