import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';

import '../../Models/sago_screen_models.dart';
import '../../Utils/text.dart';
import '../home_screen/utils/latest_movies_container.dart';

class NewMovies extends StatelessWidget {
  NewMovies({super.key});

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
              const SizedBox(
                height: 30,
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
              SizedBox(
                height: 5,
              ),
              const DefaultTextDecoration(
                text: "What’s News",
                textColor: AppColors.loginColor,
                fontWeight: FontWeight.w700,
                textSize: 40,
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultTextDecoration(
                text: "The latest releases will be shown here.",
                textColor: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
                textSize: 16,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 05,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: LatestMovieSection(
                        index: index,
                        genre: "Playlist",
                        title:
                            "The Hunger Games: The\nBallad of Songbirds\n&amp; Snakes",
                        imagePath: sagoScreenImages[index],
                        color: AppColors.whiteColor,
                        iconColor: Colors.black,
                        container: Container(
                          height: 27,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, .2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: AppColors.whiteColor,
                                size: 20,
                              ),
                              DefaultTextDecoration(
                                text: "Favorite",
                                textSize: 12,
                                textColor: AppColors.whiteColor,
                                fontWeight: FontWeight.w700,
                              )
                            ],
                          ),
                        ),
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
