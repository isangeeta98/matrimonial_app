import 'package:flutter/material.dart';
import 'package:meetmeapp/views/home_tabbar_screen.dart';
import 'package:meetmeapp/views/slider_screen.dart';
import 'dart:async';
import 'dart:io';

import '../constants/app_constants.dart';
import '../helper/app_manager.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
          () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (_) => AppManager.statusHelper.getLoginStatus ? HomeTabsScreen() : SliderScreen(),
              //const LoginScreen()
            ));
          },
              //Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: blackColor.withOpacity(0.7),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 110,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
