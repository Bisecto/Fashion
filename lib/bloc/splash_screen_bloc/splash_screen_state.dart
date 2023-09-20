part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class InternetConnectedState extends SplashScreenState {}

class InternetDisConnectedState extends SplashScreenState {}

class IsAppFirstOpenState extends SplashScreenState {}

class UserLoggedInState extends SplashScreenState {}

class UserNotLoggedInState extends SplashScreenState {}
