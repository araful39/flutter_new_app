import 'package:flutter/material.dart';
import 'package:flutter_application/constants/app_colors.dart';


final ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.allPrimaryColor,
  scaffoldBackgroundColor: AppColors.white,
  
  colorScheme: ColorScheme.light(
    primary: AppColors.allPrimaryColor,

    
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
  // Customize more as needed
);