import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';

part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenInitialEvent>(splashScreenInitialEvent);
    // on<SplashScreenEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }

  FutureOr<void> splashScreenInitialEvent(SplashScreenInitialEvent event, Emitter<SplashScreenState> emit) {
    emit(SplashScreenInitial());
  }
}
