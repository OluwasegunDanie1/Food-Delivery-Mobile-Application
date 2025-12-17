import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/constants/apptext_styles.dart';
import 'package:food/widgets/custom_button.dart';
import 'package:food/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:food/provider/auth_provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> sendResetLink() async {
    try {
      await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).reset(emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password reset email sent!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
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
                Center(
                  child: Text(
                    "Forgot Password",
                    style: ApptextStyles.mainwhite,
                  ),
                ),
                Center(
                  child: Text(
                    "Please check your mail to reset your password",
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
                          controller: emailController,
                          title: "EMAIL",
                          hinttext: "example@gmail.com",
                        ),

                        SizedBox(height: 50),
                        CustomButton(
                          title: "SEND RESET LINK",
                          onPressed: () => sendResetLink(),
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
