import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Authentication_Screens/login_screen.dart';
import 'package:movie_app/Utils/button.dart';
import 'package:movie_app/constants/colors.dart';

import '../../Utils/text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "SignUp",
                  style: TextStyle(
                      fontSize: 32,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 628,
                  width: 366,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Full Name  ",
                        style: TextStyle(
                            fontSize: 20, color: AppColors.whiteColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldsWidget(
                        text: 'Jane Cooper',
                        outlineInputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              width: 3),
                        ),
                        style: const TextStyle(color: Colors.white38),
                      ),
                      const Text(
                        "Email address",
                        style: TextStyle(
                            fontSize: 20, color: AppColors.whiteColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldsWidget(
                        text: 'janecooper@gmail.com',
                        outlineInputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              width: 3),
                        ),
                        style: const TextStyle(color: Colors.white38),
                      ),
                      const Text(
                        "Choose a password",
                        style: TextStyle(
                            fontSize: 20, color: AppColors.whiteColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldsWidget(
                        text: '***************',
                        outlineInputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              width: 3),
                        ),
                        style: const TextStyle(color: Colors.white38),
                      ),
                      const Text(
                        "Confirm password",
                        style: TextStyle(
                            fontSize: 20, color: AppColors.whiteColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldsWidget(
                        text: '***************',
                        outlineInputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              width: 3),
                        ),
                        style: const TextStyle(color: Colors.white38),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forget Passsword",
                          style: TextStyle(
                              fontSize: 16, color: AppColors.whiteColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonWidget(
                        text: "Sign Up",
                        style: const TextStyle(
                          color: AppColors.loginColor,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 16, color: AppColors.whiteColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 18, color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
