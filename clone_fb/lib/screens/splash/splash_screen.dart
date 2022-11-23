// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:clone_fb/routes/routes.dart';
import 'package:clone_fb/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    )..forward();
    animation = Tween<Offset>(
      begin: Offset(0, -.6),
      end: Offset(0, -2.81),
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.easeInOutCubic,
      ),
    );
    Timer(
      Duration(seconds: 1),
      () => Get.offNamed(
        Routes.login,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary1,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.secondary1,
          statusBarIconBrightness: Brightness.dark,
        ),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Center(
        child: SlideTransition(
          position: animation!,
          child: Container(
            padding: EdgeInsets.only(top: 47),
            child: Image(
              height: 64,
              image: AssetImage(
                'assets/images/facebook_blue.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
