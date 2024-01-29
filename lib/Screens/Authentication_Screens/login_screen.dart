import 'package:flutter/material.dart';
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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                  height: 172, width: 272, "assets/images/studio_logo.png"),
              const Text(
                "Cinem-Amatoriale",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Tutti Film Che Vuol Quando Li Vuoi Tu",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 476,
                width: 366,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: Text("Login")),
                    const Text("Email address"),
                    TextFieldsWidget(
                      text: 'janecooper@gmail.com',
                      outlineInputBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white, style: BorderStyle.none)),
                    ),
                    const Text("Choose a password"),
                    TextFieldsWidget(
                      text: '***************',
                      outlineInputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Colors.white, style: BorderStyle.none),
                      ),
                      obscureText: true,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text("Forget Passsword"),
                    ),
                    ButtonWidget(text: "Login")
                  ],
                ),
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  Text("Sign Up"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
