import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/Screens/splash_screen/splash_screen.dart';
import 'package:movie_app/Utils/routes/routes.dart';
import 'package:movie_app/Utils/routes/routes_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyD2sIPQdvOZ5XI64FUa7fKUURSL1utcwII',
          appId: '1:94491395961:android:88a0ea26b4d21e2826d1a8',
          messagingSenderId: '94491395961',
          projectId: 'movieapp-ca668',
          storageBucket: 'movieapp-ca668.appspot.com'));
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
        fontFamily: 'quickSand',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesNames.splashScreen,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
