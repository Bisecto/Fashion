import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fashion/utills/app_utils.dart';
import 'package:meta/meta.dart';

import '../../repository/auth_repo.dart';
import '../../utills/shared_preferences.dart';

part 'splash_screen_event.dart';

part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenInitialEvent>(splashScreenInitialEvent);
    // on<SplashScreenEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }

  FutureOr<void> splashScreenInitialEvent(
      SplashScreenInitialEvent event, Emitter<SplashScreenState> emit) async {
    emit(SplashScreenInitial());
    bool isConnected = await AppUtils().checkConnectivity();
    if (isConnected) {
      emit(InternetConnectedState());
      bool isFirstOpen = await SharedPref.getBool('firstOpen') ?? false;
      if (isFirstOpen) {
        emit(IsAppFirstOpenState());
      } else {
        await SharedPref.putBool('firstOpen', true);
        AuthRepo authRepo = AuthRepo();
        bool isUserLoggedIn = await authRepo.isUserLoggedIn();
        if (isUserLoggedIn) {
          emit(UserLoggedInState());
        } else {
          emit(UserNotLoggedInState());
        }
      }
    } else {
      emit(InternetDisConnectedState());
    }
  }
}
