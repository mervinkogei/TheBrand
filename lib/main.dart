import 'package:firstsplashscreenview/firstsplashscreenview.dart';
import 'package:flutter/material.dart';
import 'package:thebrand/Screens/home.dart';
import 'package:thebrand/Utils/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.getTheme(),
      home: SplashScreen(
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3),
        nextPage: HomeScreen(),
        iconBackgroundColor: Colors.white,
        circleHeight: 200,
        text: const Text(
          "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Image.asset('images/brandLogo.png', scale: 0.2,),
    ),
    );
  }
}

