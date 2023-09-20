part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class InternetState extends SplashScreenState {}

class IsAppFirstOpenState extends SplashScreenState {}

class IsUserLoggedInState extends SplashScreenState {}
