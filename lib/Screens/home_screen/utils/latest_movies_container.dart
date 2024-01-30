import 'package:flutter/material.dart';
import '../../../Utils/text.dart';
import '../../../constants/colors.dart';
import '../../../constants/side_cut_clipper.dart';

class LatestMoviesSection {
  Widget buildLatestMovieContainer(
    String category,
    String title,
    String genre,
    String imagePath,
  ) {
    return Container(
      clipBehavior: Clip.none,
      child: Stack(
        children: [
          ClipPath(
            clipper: SideCutClipper(),
            child: Container(
              height: 154,
              width: 398,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  Expanded(
                    child: Image.asset(
                      imagePath,
                      height: 130,
                      width: 141,
                    ),
                  ),
                  const SizedBox(width: 13),
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
                        textSize: 14,
                        textColor: AppColors.whiteColor,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            genre,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  stops: [0.3, 0.6],
                  colors: [
                    Color.fromRGBO(104, 119, 239, 1),
                    Color.fromRGBO(45, 206, 239, 1),
                  ],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_arrow,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
