import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Authentication_Screens/login_screen/login_screen.dart';
import 'package:movie_app/constants/colors.dart';

class IntoScreen extends StatefulWidget {
  const IntoScreen({super.key});

  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/intro_background.png"),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 420,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/intro_black_shadow.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 23.0),
                            child: const Text(
                              "Watch movies with Cinem-Amatoriale",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: const Text(
                              "Watch and download famous & blockbuster movies anytime & everywhere you want",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 60,
                                width: 274,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: AppColors.linearGradient),
                                child: const Center(
                                    child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text:
                                  'you wll get 15 days of free trial & after ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '\n8.79€ per month',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(104, 119, 239, 1))),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
