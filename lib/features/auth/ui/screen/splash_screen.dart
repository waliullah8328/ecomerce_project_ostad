import 'package:ecomerce_project_ostad/app/assets_path.dart';
import 'package:ecomerce_project_ostad/features/auth/ui/screen/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    _moveToNextScreen();
    super.initState();
  }
  Future<void> _moveToNextScreen()async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, EmailVerificationScreen.name);

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppLogoWidget(),


              Spacer(),
             CircularProgressIndicator(),

            ],
          ),
        ),
      ),
    );
  }
}


