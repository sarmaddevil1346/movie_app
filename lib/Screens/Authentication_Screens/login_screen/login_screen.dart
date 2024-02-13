import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/Screens/home_screen/home_screen.dart';
import 'package:movie_app/Utils/routes/routes_names.dart';
import 'package:movie_app/Utils/text.dart';
import 'package:movie_app/constants/colors.dart';

import '../../../Utils/alert_dialogue.dart';
import '../../../Utils/button.dart';
import '../../../Utils/text_form_field.dart';
import '../signup_screen/utils/password_fiield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                  alignment: Alignment.center,
                  height: 111,
                  width: 170,
                  "assets/images/studio_logo.png"),
              const DefaultTextDecoration(
                text: "Cinem-Amatoriale",
                textSize: 28,
                fontWeight: FontWeight.w700,
                textColor: AppColors.whiteColor,
              ),
              const DefaultTextDecoration(
                text: "Tutti Film Che Vuol Quando Li Vuoi Tu",
                textSize: 12,
                fontWeight: FontWeight.w500,
                textColor: AppColors.whiteColor,
              ),
              const SizedBox(
                height: 35,
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
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Abril',
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const DefaultTextDecoration(
                        text: "Email address",
                        textColor: AppColors.whiteColor,
                        textSize: 20,
                        fontWeight: FontWeight.w700,
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
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Choose a password",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PasswordTextFieldsWidget(
                        text: "***************",
                        outlineInputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              width: 3),
                        ),
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RoutesNames.forgotScreen);
                          },
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ButtonWidget(
                        text: "Login",
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.loginColor,
                            fontSize: 16),
                        onTap: () async {
                          logIn(
                              _emailController.text.toString().trim(),
                              _passwordController.text.toString().trim(),
                              context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DefaultTextDecoration(
                    text: "Don't have an account? ",
                    textSize: 18,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.whiteColor,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesNames.signUpScreen);
                      },
                      child: const DefaultTextDecoration(
                        text: 'Sign Up',
                        textColor: AppColors.whiteColor,
                        fontWeight: FontWeight.w400,
                        textSize: 18,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logIn(
      String email, String password, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Center(
          child: SpinKitCircle(
            size: 50,
            color: AppColors.loginColor,
          ), // Loading indicator
        );
      },
    );

    if (email.isEmpty || password.isEmpty) {
      Navigator.pop(context); // Dismiss the loading dialog
      UtilsHelper.customAlertDialogue(context, 'Fill all the data');
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pop(context); // Dismiss the loading dialog
        Navigator.pushReplacementNamed(context, RoutesNames.navScreen);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context); // Dismiss the loading dialog
        UtilsHelper.customAlertDialogue(context, e.code.toString());
      }
    }
  }
}
