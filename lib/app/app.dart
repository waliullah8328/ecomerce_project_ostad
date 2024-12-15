import 'package:ecomerce_project_ostad/app/app_colors.dart';
import 'package:ecomerce_project_ostad/app/app_theme_data.dart';
import 'package:ecomerce_project_ostad/features/auth/ui/screen/email_verification_screen.dart';
import 'package:ecomerce_project_ostad/features/auth/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/ui/screen/otp_verification_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      routes: {
        "/":(context)=> const SplashScreen(),
        EmailVerificationScreen.name:(context)=> const EmailVerificationScreen(),
        OTPVerificationScreen.name:(context)=> const OTPVerificationScreen(),
      },
    );
  }
}
