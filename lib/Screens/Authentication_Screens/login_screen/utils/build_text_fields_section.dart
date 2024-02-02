import 'package:flutter/material.dart';

import '../../../../Utils/button.dart';
import '../../../../Utils/text_form_field.dart';
import '../../../../constants/colors.dart';
import '../../../NavigationBar/navigation_screen.dart';
import '../../forget_screen.dart';

class TextFieldSection {
  Container buildTextFieldContainer(BuildContext context) {
    return Container(
      height: 476,
      width: 366,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 32,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Email address",
            style: TextStyle(fontSize: 20, color: AppColors.whiteColor),
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
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Choose a password",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldsWidget(
            text: '***************',
            outlineInputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(255, 255, 255, 1), width: 3),
            ),
            style: const TextStyle(color: Colors.white38),
            obscureText: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgetScreen(),
                  ),
                );
              },
              child: const Text(
                "Forget Password",
                style: TextStyle(fontSize: 16, color: AppColors.whiteColor),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ButtonWidget(
            text: "Login",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavigationWidget(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
