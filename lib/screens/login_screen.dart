import 'package:flutter/material.dart';

import 'package:food/constants/apptext_styles.dart';
import 'package:food/provider/auth_provider.dart';
import 'package:food/screens/forget_password.dart';
import 'package:food/screens/home.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/screens/sign_up_screen.dart';
import 'package:food/widgets/custom_button.dart';
import 'package:food/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    try {
      await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).login(emailController.text.trim(), passwordController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Successful!"),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: [
                Text("Log In", style: ApptextStyles.mainwhite),
                Text(
                  "Please sign in to your existing account",
                  style: ApptextStyles.mediumwhite,
                ),
                SizedBox(height: 50),
                Container(
                  height: 650,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        CustomTextField(
                          title: "EMAIL",
                          hinttext: "example@gmail.com",
                          controller: emailController,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          title: "PASSWORD",
                          hinttext: "1234567890",
                          isPassword: true,
                          controller: passwordController,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text("Remember me"),
                              ],
                            ),

                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgetPassword(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Forget Password",
                                    style: ApptextStyles.mediumColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        CustomButton(title: "LOGIN", onPressed: () => login()),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an accoount?",
                              style: ApptextStyles.medium,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "SIGN UP",
                                style: ApptextStyles.mediumColor,
                              ),
                            ),
                          ],
                        ),
                        Text("Or", style: ApptextStyles.medium),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.facebook_rounded,
                                  size: 50,
                                  color: Color(0xff395998),
                                ),
                              ),
                              SizedBox(width: 30),
                              GestureDetector(
                                child: Image.asset(
                                  "images/Google.png",
                                  width: 50,
                                ),
                              ),
                              SizedBox(width: 30),
                              GestureDetector(
                                child: Image.asset(
                                  "images/apple.png",
                                  width: 50,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
