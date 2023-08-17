import 'package:flutter/material.dart';

class CustomTheme{

  static const Color grey = Color(0XffDFDFDF);
  static const Color yellow = Color(0XffFFDB47);
  static const cardShadow = [BoxShadow(color: Colors.grey, offset: Offset(0,2), blurRadius: 6, spreadRadius: 4)];
  static const buttonShadow = [BoxShadow(color: Colors.grey, offset: Offset(1,3), blurRadius: 3, spreadRadius: 4)];

  static getCardDecoration(){
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: cardShadow
      );
  }

  static ThemeData getTheme(){
    Map<String, double> fontSize ={
      "sm": 14,
      "md": 18,
      "lg":24
    };
    return ThemeData(
      primaryColor: yellow,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        toolbarHeight: 70,
        centerTitle: true,
        
        titleTextStyle: TextStyle(fontSize: fontSize['lg'], fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 4)
      ),
      tabBarTheme: const TabBarTheme(labelColor: yellow, unselectedLabelColor: Colors.black),
      textTheme:TextTheme(
        headlineLarge: TextStyle(color: Colors.black, fontSize: fontSize['lg'], fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: Colors.black, fontSize: fontSize['mg'], fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(color: Colors.black, fontSize: fontSize['sm'], fontWeight: FontWeight.bold),
        titleSmall: (TextStyle(fontSize: fontSize['sm'], letterSpacing: 1))
      ),
    
    );
  }

}