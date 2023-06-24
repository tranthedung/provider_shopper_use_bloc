import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeClickOnButtonEnter>(homeClickOnButtonEnter);
  }

  FutureOr<void> homeClickOnButtonEnter(
      HomeClickOnButtonEnter event, Emitter<HomeState> emit) {
    print('clicked successfull');
    emit(HomeLoadedSuccessState());
  }
}
