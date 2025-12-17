import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food/constants/app_colors.dart';

import 'package:food/provider/order_tracking_provider.dart';
import 'package:food/screens/call_screen.dart';
import 'package:food/screens/chat_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackOrderScreen extends StatefulWidget {
  //final Restaurant res;
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    //final res = widget.res;
    final tracking = Provider.of<OrderTrackingProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Column(
        children: [
          // SizedBox(height: 40),
          // Row(
          //   children: [
          //     IconButton(
          //       icon: Icon(Icons.arrow_back_ios),
          //       onPressed: () => Navigator.pop(context),
          //     ),
          //     Text("Track Order", style: TextStyle(fontSize: 22)),
          //   ],
          // ),
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: tracking.riderLocation,
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),

                    MarkerLayer(
                      markers: [
                        Marker(
                          point: tracking.riderLocation,
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.navigation,
                            size: 40,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 35),
                      child: IconButton(
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 47),
                      child: Text(
                        "Track Order",
                        style: GoogleFonts.sen(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Bottom info
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, -2),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  tracking.status,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 5),
                ListTile(
                  leading: Container(
                    width: 70,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        "images/rider.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: Text(
                    "Uttora Coffee House",
                    style: GoogleFonts.sen(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("2x Burgers"), Text("3x Pizza")],
                  ),
                ),

                // Row(
                //   children: [
                //     CircleAvatar(
                //       backgroundImage: AssetImage("images/rider.png"),
                //     ),
                //     SizedBox(width: 10),
                //     Text(res.name),
                //   ],
                // ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "20 min",
                        style: GoogleFonts.sen(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "ESTIMATED DELIVERY TIME",
                        style: GoogleFonts.sen(
                          fontSize: 12,
                          letterSpacing: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                // TRACKING TIMELINE
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _statusRow(
                        active: true,
                        text: "Your order has been received",
                      ),
                      _lineDivider(),
                      _statusRow(
                        active: true,
                        text: "The restaurant is preparing your food",
                      ),
                      _lineDivider(),
                      _statusRow(
                        active: false,
                        text: "Your order has been picked up for delivery",
                      ),
                      _lineDivider(),
                      _statusRow(active: false, text: "Order arriving soon!"),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("images/person.png"),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Robert F.",
                              style: GoogleFonts.sen(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Courier",
                              style: GoogleFonts.sen(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CallScreen(),
                                ),
                              );
                            },
                            child: _circleButton(
                              Icons.phone,
                              AppColors.btn,
                              Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(),
                                ),
                              );
                            },
                            child: _circleButton(
                              Icons.chat_bubble_outline,
                              Colors.white,
                              AppColors.btn,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _statusRow({required bool active, required String text}) {
  return Row(
    children: [
      Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: active ? AppColors.btn : AppColors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(Icons.check, size: 12, color: Colors.white),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Text(
          text,
          style: GoogleFonts.sen(
            fontSize: 12,
            fontWeight: active ? FontWeight.w700 : FontWeight.w400,
            color: active ? AppColors.btn : Colors.grey,
          ),
        ),
      ),
    ],
  );
}

// VERTICAL LINE BETWEEN STATUS ITEMS
Widget _lineDivider() {
  return Container(
    margin: EdgeInsets.only(left: 6),
    height: 30,
    width: 2,
    color: Colors.grey.shade300,
  );
}

// CIRCLE ICON BUTTON (PHONE & CHAT)
Widget _circleButton(IconData icon, Color color, Color colo) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.orange),
    ),
    child: Icon(icon, color: colo),
  );
}
