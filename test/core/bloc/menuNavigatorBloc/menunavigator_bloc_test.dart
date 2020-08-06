import 'package:bkapp_flutter/core/bloc/menuNavigatorBloc/menunavigator_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  MenuNavigatorBloc menuBloc;

  setUp(() {
    menuBloc = MenuNavigatorBloc(
      controller: PageController()
    );
  });

  tearDown(() {
    menuBloc?.close();
  });

  test('initial state is correct', () {
    expect(menuBloc.state, MenuNavigatorInitial());
  });

  test('test button pressed props', () {
    expect(ButtonPressed(goTo: 3).props, [3]);
  });

  test('test button pressed props like string', () {
    expect(ButtonPressed(goTo: 3).toString(), 'ButtonPressed { goTo: 3 }');
  });

  group('test menu navigator button', () {
    blocTest<MenuNavigatorBloc, MenuNavigatorState>(
      'test when the button is unpressed',
      build: () => menuBloc,
      act: (bloc) => bloc.add(ButtonUnpressed()),
      expect: [MenuNavigatorInitial()]
    );

    blocTest<MenuNavigatorBloc, MenuNavigatorState>(
      'test when the button is pressed',
      build: () => MenuNavigatorBloc(
        controller: PageController(initialPage: 0)
      ),
      act: (bloc) => bloc.add(ButtonPressed(goTo: 4)),
      expect: [
        MenuNavigatorLoading(),
        MenuNavigatorLoaded()
      ]
    );

  });
}
