import 'package:flutter/material.dart';
import 'package:movie_app/Models/sago_screen_models.dart';
import 'package:movie_app/Screens/home_screen/utils/all_movies_container.dart';
import 'package:movie_app/Screens/home_screen/utils/home_header.dart';
import 'package:movie_app/Screens/home_screen/utils/latest_movies_container.dart';
import 'package:movie_app/Screens/new_posts/new_movies.dart';
import 'package:movie_app/Utils/all_titles_section.dart';
import 'package:movie_app/Screens/home_screen/utils/top_movies_section.dart';
import 'package:movie_app/Utils/routes/routes_names.dart';
import 'package:movie_app/Utils/text.dart';
import '../../constants/colors.dart';
import '../Sago/sago_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeHeaderUtilities _headerUtilities = HomeHeaderUtilities();
  final HomeTitleSection _homeTitleSection = HomeTitleSection();
  final AllMoviesContainer _allMoviesContainer = AllMoviesContainer();
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
                _homeTitleSection.buildSectionTitle("Movies",
                    fontWeight: FontWeight.w700,
                    subtitle: "Explore by genre and mood"),
                const SizedBox(height: 15),
                _allMoviesContainer.buildMovieContainer(
                  "The Shepherd",
                  "Aug 10, 2023",
                  ["Drama", "Fantasy"],
                  "assets/images/movie1.png",
                ),
                const SizedBox(height: 10),
                _homeTitleSection.buildSectionTitle("Latest Movies",
                    fontWeight: FontWeight.w700),
                const SizedBox(height: 10),
                LatestMovieSection(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesNames.newMovieScreen);
                  },
                  index: 0,
                  genre: "Playlist",
                  title:
                      "The Hunger Games: The\nBallad of Songbirds\n&amp; Snakes",
                  imagePath: sagoScreenImages[1],
                  gradient: AppColors.linearGradient,
                  iconColor: AppColors.whiteColor,
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
                const SizedBox(
                  height: 10,
                ),
                _homeTitleSection.buildSectionTitle("Top Movies",
                    fontWeight: FontWeight.w700),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: _topMoviesSection.topMoviesContainer(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultTextDecoration(
                        text: "Sago",
                        textSize: 20,
                        fontWeight: FontWeight.w700,
                        textColor: AppColors.whiteColor),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesNames.sagaScreen);
                      },
                      child: DefaultTextDecoration(
                          text: "View All",
                          textSize: 20,
                          fontWeight: FontWeight.w700,
                          textColor: AppColors.whiteColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      sagoScreenImages.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: sagoContainerSection(index: index)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _homeTitleSection.buildSectionTitle(
                  "You might like these movies",
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 90,
                          backgroundImage:
                              AssetImage("assets/images/Ellipse1.png"),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _homeTitleSection.buildSectionTitle(
                  "Recently played",
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: _topMoviesSection.topMoviesContainer(),
                ),
                const SizedBox(
                  height: 10,
                ),
                _homeTitleSection.buildSectionTitle(
                  "Favourite",
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 200,
                        width: 150,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                height: 190,
                                width: 150,
                                child: Image.asset(
                                    "assets/images/favourite_movie1.png"),
                              ),
                            ),
                            _homeTitleSection.buildSectionTitle("Animal",
                                fontWeight: FontWeight.w700),
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
