import 'package:flutter/material.dart';

import '../view/important_pages/not_found_page.dart';
import '../view/splash_screen.dart';

class AppRouter {
  ///All route name

  /// ONBOARDING SCREEEN
  static const String splashScreen = '/';
  static const String onBoardingScreen = "/on-boarding-screen";

  /// AUTH SCREENS
  static const String signInPage = "/sign-in-page";
  static const String createAccountPage = "/sign-up-page";
  static const String otpPage = "/otp-page";
  static const String signUpPageGetStarted = "/sign-up-page-get-started";

  ///IMPORTANT SCREENS
  static const String noInternetScreen = "/no-internet";

  ///LANDING PAGE LandingPage
  static const String landingPage = "/landing-page";
  static const String notificationPage = "/notification-page";

  static const String chooseLocation = "/choose-location-page";

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case onBoardingScreen:
      //   return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      // case signInPage:
      //   return MaterialPageRoute(builder: (_) => const SignInPage());
      // case signUpPageGetStarted:
      //   return MaterialPageRoute(
      //       builder: (_) => const CreateAccountGetStartedPage());
      // case otpPage:
      //   return MaterialPageRoute(builder: (_) => const OTPPage());
      // case landingPage:
      //   return MaterialPageRoute(builder: (_) => const LandingPage());
      // case createAccountPage:
      //   return MaterialPageRoute(builder: (_) => const CreateAccountPage());
      // case notificationPage:
      //   return MaterialPageRoute(builder: (_) => const NotificationPage());
      // case chooseLocation:
      //   return MaterialPageRoute(builder: (_) => const ChooseLocation());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
