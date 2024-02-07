import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';

class SagoScreen extends StatelessWidget {
  const SagoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Icon(
                Icons.arrow_back,
                color: AppColors.loginColor,
                size: 25,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 172,
                width: 172,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/sago1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
