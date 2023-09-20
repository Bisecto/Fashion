import 'package:fashion/res/app_images.dart';
import 'package:fashion/utills/app_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppUtils.deviceScreenSize(context).width,
        height:AppUtils.deviceScreenSize(context).height,
        decoration:  const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.splashScreen),fit: BoxFit.fill)
        ),
      ),
    );
  }
}
