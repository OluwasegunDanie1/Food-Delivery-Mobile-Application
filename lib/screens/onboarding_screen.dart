import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/constants/apptext_styles.dart';
import 'package:food/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int selectedIndex = 0;

  final List<Map<String, dynamic>> onboardings = [
    {
      "image": "images/onboarding1.png",
      "title": "All Your Favorites",
      "desc":
          "Get all your loved foods in one place, you just place the order we do the rest",
      "button": "NEXT",
    },
    {
      "image": "images/onboarding2.png",
      "title": "Order from choosen chef",
      "desc":
          "Get all your loved foods in one place, you just place the order we do the rest",
      "button": "NEXT",
    },
    {
      "image": "images/onboarding3.png",
      "title": "Free delivery offers",
      "desc":
          "Get all your loved foods in one place, you just place the order we do the rest",
      "button": "GET STARTED",
    },
  ];

  void nextPage() {
    if (selectedIndex < onboardings.length - 1) {
      controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: controller,
        itemCount: onboardings.length,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        itemBuilder: (context, index) {
          final data = onboardings[index];
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20, top: 120),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(data["image"]),
                  Text(data["title"], style: ApptextStyles.main),
                  SizedBox(height: 20),
                  Text(
                    data["desc"],
                    style: ApptextStyles.medium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboardings.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 3),
                        margin: EdgeInsets.all(5),
                        height: 10,
                        width: selectedIndex == index ? 25 : 10,
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? AppColors.btn
                              : AppColors.dot,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.btn,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: nextPage,
                    child: Text(
                      data["button"],
                      style: GoogleFonts.sen(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  if (selectedIndex != onboardings.length - 1)
                    TextButton(
                      onPressed: () {},
                      child: Text("Skip", style: ApptextStyles.medium),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
