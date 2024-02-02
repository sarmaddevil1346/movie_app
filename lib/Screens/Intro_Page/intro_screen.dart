import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Authentication_Screens/login_screen/login_screen.dart';

class IntoScreen extends StatefulWidget {
  const IntoScreen({super.key});

  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 838,
        width: 726,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/intro_background.png"))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage("assets/images/intro_black_shadow.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const Positioned(
                    bottom: 250,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Watch movies with Cinem-Amatoriale",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const Positioned(
                    bottom: 160,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Watch and download famous & blockbuster movies anytime & everywhere you want",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                stops: [
                                  0.3,
                                  0.6,
                                ],
                                colors: [
                                  Color.fromRGBO(104, 119, 239, 1),
                                  Color.fromRGBO(45, 206, 239, 1),
                                ],
                              )),
                          child: const Center(
                              child: Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'you wll get 15 days of free trial & after ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '\n8.79€ per month',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(104, 119, 239, 1))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
