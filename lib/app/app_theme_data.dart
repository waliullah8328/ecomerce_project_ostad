import 'package:ecomerce_project_ostad/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData{

  static ThemeData get lightThemeData{
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themeColor
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        titleLarge:TextStyle(fontSize: 28,fontWeight: FontWeight.w600),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        border: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.themeColor,
              width: 1,

            )
        ),
        enabledBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.themeColor,
              width: 1,

            )
        ),
        focusedBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.themeColor,
              width: 1,

            )
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
            backgroundColor: AppColors.themeColor,
            foregroundColor: Colors.white,
            fixedSize: const Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular(8)
            ),
            textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          )
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.themeColor,
        )
      )

    );
  }
  static ThemeData get darkThemeData{
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themeColor
      ),
      brightness: Brightness.dark,
      //scaffoldBackgroundColor: Color(0xff090909)

    );
  }


}