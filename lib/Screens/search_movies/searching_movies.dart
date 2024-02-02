import 'package:flutter/material.dart';
import 'package:movie_app/Utils/all_titles_section.dart';
import 'package:movie_app/Utils/text_form_field.dart';
import 'package:movie_app/constants/colors.dart';

import '../../Utils/text.dart';

class SearchingMovies extends StatefulWidget {
  const SearchingMovies({super.key});

  @override
  State<SearchingMovies> createState() => _SearchingMoviesState();
}

class _SearchingMoviesState extends State<SearchingMovies> {
  final HomeTitleSection _homeTitleSection = HomeTitleSection();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                _homeTitleSection.buildSectionTitle("Search"),
                const SizedBox(
                  height: 20,
                ),
                TextFieldsWidget(
                  text: 'Search',
                  filled: true,
                  fillColor: AppColors.textFieldFillColor,
                  preFixColor: AppColors.whiteColor,
                  preFixIcon: const Icon(Icons.search),
                  hintTextStyle: const TextStyle(color: AppColors.whiteColor),
                  outlineInputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.textFieldFillColor),
                  child: Row(
                    children: [
                      Image.asset("assets/images/video_logo.png"),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextDecoration(
                            text: 'MovieFinder',
                            textSize: 18,
                            fontWeight: FontWeight.w700,
                            textColor: AppColors.whiteColor,
                          ),
                          DefaultTextDecoration(
                            text: 'Determine which song is currently playing',
                            textSize: 12,
                            fontWeight: FontWeight.w400,
                            textColor: AppColors.whiteColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultTextDecoration(
                      text: 'Recent Searches',
                      textSize: 24,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.whiteColor,
                    ),
                    DefaultTextDecoration(
                      text: 'Clear',
                      textSize: 20,
                      fontWeight: FontWeight.w300,
                      textColor: AppColors.whiteColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/video_logo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: const DefaultTextDecoration(
                          text: "Godzilla Minus One",
                          textColor: AppColors.whiteColor,
                          fontWeight: FontWeight.w700,
                          textSize: 20,
                        ),
                        subtitle: const DefaultTextDecoration(
                          text: 'Godzilla Minus One',
                          textColor: AppColors.whiteColor,
                          textSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.textFieldFillColor),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/video_logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: const DefaultTextDecoration(
                      text: "Godzilla Minus One",
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      textSize: 20,
                    ),
                    trailing: Icon(
                      Icons.play_arrow,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
