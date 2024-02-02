import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';

import '../../Utils/text.dart';
import '../home_screen/utils/latest_movies_container.dart';

class NewMovies extends StatelessWidget {
  final LatestMoviesSection _latestMoviesSection = LatestMoviesSection();

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
                height: 20,
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
                      child: _latestMoviesSection.buildLatestMovieContainer(
                          "Playlist",
                          "The Hunger Games: The\nBallad of Songbirds &amp;\nSnakes",
                          "Fantasy",
                          "assets/images/latest_movie.png",
                          context,
                          color: AppColors.whiteColor),
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
