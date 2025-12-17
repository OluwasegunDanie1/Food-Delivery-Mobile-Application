import 'dart:async';

import 'package:flutter/material.dart';

import 'package:food/services/auth_gate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthGate()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 370.0),
            child: Center(child: Image.asset('images/Logo.png', width: 200)),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 130.0),
            child: Image.asset("images/sp.png", width: 270),
          ),
        ],
      ),
    );
  }
}
