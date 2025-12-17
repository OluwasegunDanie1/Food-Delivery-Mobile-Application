import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/screens/track_order_scree.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(""), backgroundColor: Colors.white),
      body: Column(
        children: [
          SizedBox(height: 200),
          Center(child: Image.asset("images/happy.png")),
          Text(
            "Congratulations!",
            style: GoogleFonts.sen(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 30),
          Text(
            "You successfully make a payment,\n enjoy our service!",
            textAlign: TextAlign.center,
            style: GoogleFonts.sen(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 120),
          Padding(
            padding: const EdgeInsets.all(20.0),
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
                  MaterialPageRoute(builder: (context) => TrackOrderScreen()),
                );
              },
              child: Text(
                "TRACK ORDER",
                style: GoogleFonts.sen(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
