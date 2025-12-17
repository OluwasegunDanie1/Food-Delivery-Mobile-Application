import 'dart:ui';

import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset("images/person.png", fit: BoxFit.cover),
          ),

          // Blur the background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.black26),
            ),
          ),

          // Bottom white overlay
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 222, 220, 220),
                    radius: 45,
                    backgroundImage: AssetImage("images/person.png"),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    "Robert Fox",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Status
                  const Text(
                    "Connecting......",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  const Spacer(),

                  // Action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _roundButton(
                        icon: Icons.mic_off_rounded,
                        bgColor: Colors.grey.shade200,
                        iconColor: Colors.black87,
                      ),
                      const SizedBox(width: 35),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: _roundButton(
                          icon: Icons.call_end_rounded,
                          bgColor: Colors.red,
                          iconColor: Colors.white,
                          size: 70,
                        ),
                      ),
                      const SizedBox(width: 35),
                      _roundButton(
                        icon: Icons.volume_up_rounded,
                        bgColor: Colors.grey.shade200,
                        iconColor: Colors.black87,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _roundButton({
    required IconData icon,
    required Color bgColor,
    required Color iconColor,
    double size = 55,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Icon(icon, color: iconColor, size: size * 0.4),
    );
  }
}
