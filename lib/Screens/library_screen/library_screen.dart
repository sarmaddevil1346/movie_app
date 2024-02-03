import 'package:flutter/material.dart';
import 'package:movie_app/Models/search_movie_models.dart';
import 'package:movie_app/Utils/text.dart';
import 'package:movie_app/constants/colors.dart';

import '../../Models/library_models.dart';
import '../../Utils/text_form_field.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

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
                  height: 20,
                ),
                const DefaultTextDecoration(
                  text: "Library",
                  textSize: 32,
                  fontWeight: FontWeight.w700,
                  textColor: AppColors.whiteColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldsWidget(
                  text: 'Search Movies',
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
                Expanded(
                  child: ListView.builder(
                    itemCount: getLibraryModels.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.asset(
                            height: 25,
                            width: 25,
                            getLibraryModels[index].imagePath),
                        title: Text(
                          getLibraryModels[index].title,
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
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
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(movieSearchList[3]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: const DefaultTextDecoration(
                      text: "Godzilla Minus One",
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      textSize: 20,
                    ),
                    trailing: const Icon(
                      Icons.play_arrow,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
