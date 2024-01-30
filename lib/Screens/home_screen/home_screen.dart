import 'package:flutter/material.dart';
import 'package:movie_app/Screens/home_screen/utils/all_movies_container.dart';
import 'package:movie_app/Screens/home_screen/utils/home_header.dart';
import 'package:movie_app/Utils/all_titles_section.dart';
import 'package:movie_app/Screens/home_screen/utils/top_movies_section.dart';

import 'utils/latest_movies_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeHeaderUtilities _headerUtilities = HomeHeaderUtilities();
  final HomeTitleSection _homeTitleSection = HomeTitleSection();
  final AllMoviesContainer _allMoviesContainer = AllMoviesContainer();
  final LatestMoviesSection _latestMoviesSection = LatestMoviesSection();
  final TopMoviesSection _topMoviesSection = TopMoviesSection();

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _headerUtilities.buildHeaderRow(context),
                const SizedBox(height: 20),
                _homeTitleSection.buildSectionTitle(
                    "Movies", "Explore by genre and mood"),
                const SizedBox(height: 15),
                _allMoviesContainer.buildMovieContainer(
                  "The Shepherd",
                  "Aug 10, 2023",
                  ["Drama", "Fantasy"],
                  "assets/images/movie1.png",
                ),
                const SizedBox(height: 20),
                _homeTitleSection.buildSectionTitle("Latest Movies"),
                const SizedBox(height: 20),
                _latestMoviesSection.buildLatestMovieContainer(
                  "Playlist",
                  "The Hunger Games: The\nBallad of Songbirds &amp;\nSnakes",
                  "Fantasy",
                  "assets/images/latest_movie.png",
                ),
                const SizedBox(
                  height: 20,
                ),
                _homeTitleSection.buildSectionTitle("Top Movies"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: _topMoviesSection.topMoviesContainer(),
                ),
                const SizedBox(
                  height: 20,
                ),
                _homeTitleSection
                    .buildSectionTitle("You might like these movies"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 214,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return const CircleAvatar(
                        radius: 110,
                        backgroundImage:
                            AssetImage("assets/images/Ellipse1.png"),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _homeTitleSection.buildSectionTitle("Recently played"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: _topMoviesSection.topMoviesContainer(),
                ),
                const SizedBox(
                  height: 20,
                ),
                _homeTitleSection.buildSectionTitle("Recently played"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 230,
                        width: 157,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Image.asset(
                                    "assets/images/favourite_movie1.png"),
                              ),
                            ),
                            _homeTitleSection.buildSectionTitle("Animal"),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
