import 'package:fashion/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:fashion/res/app_images.dart';
import 'package:fashion/utills/app_utils.dart';
import 'package:fashion/view/important_pages/not_found_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../res/app_router.dart';
import '../../utills/app_navigator.dart';
import '../important_pages/dialog_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenBloc screenBloc = SplashScreenBloc();

  @override
  void initState() {
    // TODO: implement initState
    screenBloc.add(SplashScreenInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SplashScreenBloc, SplashScreenState>(
            bloc: screenBloc,
            buildWhen: (previous, current) =>
                current is! UserLoggedInState ||
                current is! UserNotLoggedInState,
            listenWhen: (previous, current) => current is! SplashScreenInitial,
            builder: (context, state) {
              switch (state.runtimeType) {
                case SplashScreenInitial:
                  return Container(
                    width: AppUtils.deviceScreenSize(context).width,
                    height: AppUtils.deviceScreenSize(context).height,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.splashScreen),
                            fit: BoxFit.fill)),
                  );
                default:
                  return Container(
                    width: AppUtils.deviceScreenSize(context).width,
                    height: AppUtils.deviceScreenSize(context).height,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.splashScreen),
                            fit: BoxFit.fill)),
                  );
              }
            },
            listener: (context, state) {
              if (state is InternetDisConnectedState) {
                MSG.warningSnackBar(context, "There is no internet connection");

                ///POP MSG DIALOG
              } else if (state is IsAppFirstOpenState) {
                MSG.warningSnackBar(context, "There is no internet connection");
                print("Going to oN boarding screen");
                AppNavigator.pushAndReplaceName(context,
                    name: AppRouter.onBoardingScreen);

                ///MOVE TO ONBOARDING SCREEN
              } else if (state is UserLoggedInState) {
                print("Logged in");

                ///GO TO HOMEPAGE
              } else if (state is UserNotLoggedInState) {
                print("Not logged in");

                ///Go to log in page
              }
            }));
  }
}
