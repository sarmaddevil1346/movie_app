import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Utils/button.dart';
import 'package:movie_app/Utils/routes/routes_names.dart';
import 'package:movie_app/constants/colors.dart';
import '../../Utils/alert_dialogue.dart';
import '../../Utils/text.dart';
import '../../Utils/text_form_field.dart';
import 'login_screen/login_screen.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/forgot_background.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: height.height,
              width: width.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutesNames.loginScreen);
                        },
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: "Abril",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Center(
                      child: SizedBox(
                          height: 200,
                          width: 197,
                          child: Image(
                            image: AssetImage("assets/images/forget_logo.png"),
                          )),
                    ),
                    const Spacer(),
                    const Center(
                      child: Text(
                        "Forgot Your Password",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const DefaultTextDecoration(
                      text:
                          "Please enter the email address associated with your account. We'll mail you a link to reset your password.",
                      textColor: Colors.white,
                      textSize: 18,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: DefaultTextDecoration(
                        text: "Email address",
                        textColor: AppColors.whiteColor,
                        fontWeight: FontWeight.w700,
                        textSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldsWidget(
                      text: "Email Address",
                      outlineInputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1), width: 3),
                      ),
                      style: const TextStyle(color: Colors.white38),
                      controller: textEditingController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ButtonWidget(
                        text: 'Send',
                        style: const TextStyle(
                            color: AppColors.loginColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                        onTap: () {
                          forget(textEditingController.text);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> forget(String email) async {
    if (email.isEmpty) {
      UtilsHelper.customAlertDialogue(context, 'Fill all the data');
    } else {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Navigator.pushReplacementNamed(context, RoutesNames.loginScreen);
      } on FirebaseAuthException catch (e) {
        UtilsHelper.customAlertDialogue(context, e.code.toString());
      }
    }
  }
}
