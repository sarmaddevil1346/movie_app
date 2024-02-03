import 'package:flutter/material.dart';
import '../../../../Utils/button.dart';
import '../../../../Utils/text_form_field.dart';
import '../../../../constants/colors.dart';
import '../../login_screen/login_screen.dart';

class TextFieldSection {
  Widget buildTextFieldsSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 100,
        ),
        const Text(
          "Full Name  ",
          style: TextStyle(
              fontSize: 20,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFieldsWidget(
          text: 'Jane Cooper',
          outlineInputBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
                color: Color.fromRGBO(255, 255, 255, 1), width: 3),
          ),
          style: const TextStyle(color: Colors.white38),
        ),
        const Text(
          "Email address",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFieldsWidget(
          text: 'janecooper@gmail.com',
          outlineInputBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
                color: Color.fromRGBO(255, 255, 255, 1), width: 3),
          ),
          style: const TextStyle(color: Colors.white38),
        ),
        const Text(
          "Choose a password",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFieldsWidget(
          text: '***************',
          suffixIcon: const Icon(
            Icons.visibility_off_outlined,
            color: AppColors.whiteColor,
          ),
          outlineInputBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
                color: Color.fromRGBO(255, 255, 255, 1), width: 3),
          ),
          style: const TextStyle(color: Colors.white38),
        ),
        const Text(
          "Confirm password",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFieldsWidget(
          text: '***************',
          suffixIcon: const Icon(
            Icons.visibility_off_outlined,
            color: AppColors.whiteColor,
          ),
          outlineInputBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
                color: Color.fromRGBO(255, 255, 255, 1), width: 3),
          ),
          style: const TextStyle(color: Colors.white38),
        ),
        const SizedBox(
          height: 30,
        ),
        ButtonWidget(
          text: "Sign Up",
          style: const TextStyle(
            color: AppColors.loginColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        )
      ],
    );
  }
}
