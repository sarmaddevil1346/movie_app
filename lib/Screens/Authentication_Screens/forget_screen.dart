import 'package:flutter/material.dart';
import 'package:movie_app/Utils/button.dart';
import 'package:movie_app/constants/colors.dart';
import '../../Utils/text.dart';
import '../../Utils/text_form_field.dart';
import 'login_screen/login_screen.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController _emailEditingController = TextEditingController();

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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
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
                      child: DefaultTextDecoration(
                        text: "Forgot Password",
                        textColor: Colors.white,
                        textSize: 32,
                        fontWeight: FontWeight.w800,
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
                            fontWeight: FontWeight.bold,
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
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    TextFieldsWidget(
                      text: "Email Address",
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
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ButtonWidget(
                        text: 'Send',
                        style: const TextStyle(
                            color: AppColors.loginColor, fontSize: 16),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
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
}
