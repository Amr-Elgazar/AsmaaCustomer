
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import 'view/auth/login_screen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 5000,
        nextScreen:LoginScreen(),
        splash: Image.asset('assets/logo.jpg'),
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 200.0,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}
