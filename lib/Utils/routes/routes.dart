import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Authentication_Screens/forget_screen.dart';
import 'package:movie_app/Screens/Authentication_Screens/login_screen/login_screen.dart';
import 'package:movie_app/Screens/Intro_Page/intro_screen.dart';
import 'package:movie_app/Screens/NavigationBar/navigation_screen.dart';
import 'package:movie_app/Screens/Sago/sago_screen.dart';
import 'package:movie_app/Screens/home_screen/home_screen.dart';
import 'package:movie_app/Screens/new_posts/new_movies.dart';
import 'package:movie_app/Screens/profile_screen/profile_screen.dart';
import 'package:movie_app/Screens/splash_screen/splash_screen.dart';
import 'package:movie_app/Utils/routes/routes_names.dart';
import 'package:movie_app/constants/colors.dart';
import '../../Screens/Authentication_Screens/signup_screen/signUp_screen.dart';

class Routes {
  static Route<dynamic>? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case RoutesNames.introScreen:
        return MaterialPageRoute(
          builder: (context) => IntroScreen(),
        );
      case RoutesNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RoutesNames.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case RoutesNames.forgotScreen:
        return MaterialPageRoute(
          builder: (context) => ForgetScreen(),
        );
      case RoutesNames.navScreen:
        return MaterialPageRoute(
          builder: (context) => NavigationWidget(),
        );
      case RoutesNames.profileScreen:
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        );
      case RoutesNames.newMovieScreen:
        return MaterialPageRoute(
          builder: (context) => NewMovies(),
        );
      case RoutesNames.sagaScreen:
        return MaterialPageRoute(
          builder: (context) => SagaScreen(),
        );
      case RoutesNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              backgroundColor: AppColors.profileBackgroundColor,
              body: Center(
                child: Text(
                  "No Routing Found....",
                  style: TextStyle(
                    color: AppColors.loginColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ),
            );
          },
        );
    }
  }
}
