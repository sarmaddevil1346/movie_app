import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Authentication_Screens/forget_screen.dart';
import 'package:movie_app/Screens/Authentication_Screens/login_screen.dart';
import 'package:movie_app/Screens/Authentication_Screens/signUp_screen.dart';
import 'package:movie_app/Screens/home_screen/home_screen.dart';
import 'package:movie_app/Screens/library_screen/library_screen.dart';
import 'package:movie_app/Screens/search_movies/searching_movies.dart';
import 'package:movie_app/Screens/splash_screen.dart';

import 'Screens/NavigationBar/navigation_screen.dart';
import 'constants/side_cut_clipper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavigationWidget(),
    );
  }
}
