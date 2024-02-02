import 'package:flutter/material.dart';
import 'package:movie_app/Utils/text.dart';
import 'package:movie_app/constants/colors.dart';

class SpeedDialogue extends StatelessWidget {
  const SpeedDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.profileBackgroundColor,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              DefaultTextDecoration(
                text: "Set as playback speed",
                textSize: 20,
                textColor: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
              ),
              Container(
                height: 23,
                width: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.whiteColor, width: 2)),
              ),
              // List<int>.generate(3, (int index) => index * index, growable: true);
            ],
          ),
        ),
      ),
    );
  }
}
