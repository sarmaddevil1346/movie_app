import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Authentication_Screens/login_screen/login_screen.dart';
import 'package:movie_app/Screens/Authentication_Screens/signup_screen/utils/select_image.dart';
import 'package:movie_app/Screens/Authentication_Screens/signup_screen/utils/textFieldContainer.dart';
import 'package:movie_app/constants/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final PicImageSectionWidget _imageSectionWidget = PicImageSectionWidget();
  final TextFieldSection _fieldSection = TextFieldSection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )),
                  const Spacer(),
                  const Text(
                    "SignUp",
                    style: TextStyle(
                        fontSize: 32,
                        color: AppColors.whiteColor,
                        fontFamily: "Abril",
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 628,
                  width: 366,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      _imageSectionWidget.buildPicImageSection(),
                      _fieldSection.buildTextFieldsSection(context)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
