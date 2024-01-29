import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Authentication_Screens/signUp_screen.dart';
import 'package:movie_app/Utils/button.dart';
import 'package:movie_app/constants/colors.dart';

import '../../Utils/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
                alignment: Alignment.center,
                height: 111,
                width: 170,
                "assets/images/studio_logo.png"),
            const Text(
              "Cinem-Amatoriale",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              "Tutti Film Che Vuol Quando Li Vuoi Tu",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
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
                    SizedBox(
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
                      style:
                          TextStyle(fontSize: 20, color: AppColors.whiteColor),
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
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(text: "Login"),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 5,
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
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16, color: AppColors.whiteColor),
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
    );
  }
}
