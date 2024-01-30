import 'package:flutter/material.dart';
import 'package:movie_app/Utils/all_titles_section.dart';
import 'package:movie_app/Utils/text_form_field.dart';
import 'package:movie_app/constants/colors.dart';

class SearchingMovies extends StatefulWidget {
  const SearchingMovies({super.key});

  @override
  State<SearchingMovies> createState() => _SearchingMoviesState();
}

class _SearchingMoviesState extends State<SearchingMovies> {
  HomeTitleSection _homeTitleSection = HomeTitleSection();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
