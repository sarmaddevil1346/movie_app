import 'package:flutter/material.dart';

import '../../../Utils/text.dart';
import '../../../constants/colors.dart';

class AllMoviesContainer {
  Widget buildMovieContainer(
    String title,
    String date,
    List<String> genres,
    String imagePath,
  ) {
    return Container(
      height: 154,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          FittedBox(
            child: Image.asset(
              imagePath,
              height: 130,
              width: 141,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultTextDecoration(
                  text: title,
                  textSize: 20,
                  textColor: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
                DefaultTextDecoration(
                  text: date,
                  textSize: 14,
                  fontWeight: FontWeight.w300,
                  textColor: AppColors.whiteColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: genres
                      .map(
                        (genre) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 80,
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
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
