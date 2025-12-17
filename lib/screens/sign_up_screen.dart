import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/constants/apptext_styles.dart';
import 'package:food/provider/auth_provider.dart';
import 'package:food/screens/login_screen.dart';
import 'package:food/widgets/custom_button.dart';
import 'package:food/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypepasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    retypepasswordController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    if (passwordController.text != retypepasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Password do not match")));
      return;
    }
    try {
      await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).register(emailController.text.trim(), passwordController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration Successful"),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.grey,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(child: Text("Sign Up", style: ApptextStyles.mainwhite)),
                Center(
                  child: Text(
                    "Please sign up to get started",
                    style: ApptextStyles.mediumwhite,
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  height: 650,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          title: "NAME",
                          hinttext: "john doe",
                          controller: nameController,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          title: "EMAIL",
                          hinttext: "example@gmail.com",
                          controller: emailController,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          title: "PASSWORD",
                          hinttext: "*********",
                          isPassword: true,
                          controller: passwordController,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          title: "RE-TYPE PASSWORD",
                          hinttext: "**********",
                          isPassword: true,
                          controller: retypepasswordController,
                        ),
                        SizedBox(height: 50),
                        CustomButton(
                          title: "SIGN UP",
                          onPressed: () => register(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
