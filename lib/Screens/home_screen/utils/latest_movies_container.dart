import 'package:flutter/material.dart';
import 'package:movie_app/Screens/new_posts/new_movies.dart';
import '../../../Utils/text.dart';
import '../../../constants/colors.dart';
import '../../../Utils/side_cut_clipper.dart';
import '../../jwdbvobv.dart';

class LatestMoviesSection {
  Widget buildLatestMovieContainer(final String category, final String title,
      final String genre, final String imagePath, context,
      {LinearGradient? gradient, Color? color, Color? iconColor}) {
    return SizedBox(
      height: 154,
      child: Stack(
        children: [
          ClipPath(
            clipper: SideCutClipper(),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewMovies(),
                    ));
              },
              child: Container(
                height: 154,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Container(
                      height: 130,
                      width: 141,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(
                              imagePath,
                            ),
                          )),
                    ),
                    const SizedBox(width: 6),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextDecoration(
                          text: category,
                          textSize: 16,
                          textColor: AppColors.whiteColor,
                        ),
                        DefaultTextDecoration(
                          text: title,
                          textSize: 12,
                          fontWeight: FontWeight.w700,
                          textColor: AppColors.whiteColor,
                          maxLines: 5,
                        ),
                        Container(
                          width: 110,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 22,
                                color: AppColors.whiteColor,
                              ),
                              Text(
                                genre,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 11,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: gradient,
                  color: color),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoPlayerWidget(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.play_arrow,
                    color: iconColor,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
