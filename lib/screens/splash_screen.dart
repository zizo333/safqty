import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safqty/constents/keywords.dart';
import 'package:safqty/screens/auth/intro_screen.dart';
import 'package:safqty/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _state = false;

  @override
  void initState() {
    _checkIntroState();
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => _state ? LoginScreen() : IntroScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 147,
              height: 202.76,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  // TODO: Helper functions
  Future<void> _checkIntroState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final state = prefs.getBool(FIRST_TIME);
    if (state == null) {
      _state = false;
      return;
    }
    _state = state;
  }
}
