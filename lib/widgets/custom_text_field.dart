import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/constants/apptext_styles.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String? hinttext;
  final TextEditingController? controller;
  final bool isPassword;
  final IconData? icon;
  final int? maxlines;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.title,
    this.hinttext,
    this.controller,
    this.isPassword = false,
    this.icon,
    this.onChanged,
    this.maxlines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: ApptextStyles.medium),
        const SizedBox(height: 10),
        TextField(
          maxLines: widget.maxlines,
          onChanged: widget.onChanged,
          controller: widget.controller,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                : null,

            filled: true,
            fillColor: AppColors.grey,
            hintStyle: TextStyle(color: AppColors.black),
            hintText: widget.hinttext,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
