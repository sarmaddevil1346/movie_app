import 'package:flutter/material.dart';
import 'package:movie_app/Models/sago_screen_models.dart';
import 'package:movie_app/constants/colors.dart';

import '../../Utils/text.dart';
import '../home_screen/utils/latest_movies_container.dart';

class Trilogy extends StatelessWidget {
  Trilogy({super.key});

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
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const DefaultTextDecoration(
                text: "The Trilogy3",
                textColor: AppColors.loginColor,
                fontWeight: FontWeight.w700,
                textSize: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: sagoScreenImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: LatestMovieSection(
                        index: index,
                        imagePath: sagoScreenImages[index],
                        title:
                            "The Hunger Games: The\nBallad of Songbirds\n&amp; Snakes",
                        color: AppColors.whiteColor,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
