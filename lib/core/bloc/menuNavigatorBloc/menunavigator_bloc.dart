import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'menunavigator_event.dart';
part 'menunavigator_state.dart';

class MenuNavigatorBloc
  extends Bloc<MenuNavigatorEvent, MenuNavigatorState> {
  final PageController controller;

  MenuNavigatorBloc({@required this.controller});

  @override
  MenuNavigatorState get initialState => MenuNavigatorInitial();

  @override
  Stream<MenuNavigatorState> mapEventToState(
    MenuNavigatorEvent event,
  ) async* {
    if (event is ButtonPressed) {
      yield MenuNavigatorLoading();
      yield MenuNavigatorLoaded();
      controller.jumpToPage(event.goTo);
    }

    if (event is ButtonUnpressed) {
      yield MenuNavigatorInitial();
    }
  }
}
