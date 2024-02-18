import 'dart:async';
import 'package:flutter/material.dart';
import 'package:maxedoutstats/route_generator.dart';
import 'package:maxedoutstats/utils/index_utils.dart';
import 'package:maxedoutstats/utils/navigation.dart';
import 'package:maxedoutstats/widget/background_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => AppNavigation.navigateReplacementNamed(context, Routes.preLoginRoute));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BackgroundImage(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            height: sizeHeight(context) * 0.4,
            width: sizeWidth(context) * 0.4,
            child: Image.asset(AppAssets.splashlogo),
          ),
        ),
      ));
}
