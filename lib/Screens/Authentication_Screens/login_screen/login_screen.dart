import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Authentication_Screens/login_screen/utils/build_text_fields_section.dart';
import 'package:movie_app/Screens/Authentication_Screens/signup_screen/signUp_screen.dart';
import 'package:movie_app/Utils/text.dart';
import 'package:movie_app/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextFieldSection _textFieldSection = TextFieldSection();
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
              DefaultTextDecoration(
                text: "Cinem-Amatoriale",
                textSize: 28,
                fontWeight: FontWeight.w700,
                textColor: AppColors.whiteColor,
              ),
              DefaultTextDecoration(
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
                child: _textFieldSection.buildTextFieldContainer(context),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextDecoration(
                    text: "Already have an account? ",
                    textSize: 18,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.whiteColor,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: DefaultTextDecoration(
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
}
