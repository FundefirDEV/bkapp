import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SelectCityBloc extends FormBloc<String, String> {
  final selectState = SelectFieldBloc(
    items: [
      'Select your state',
      'Cundinamarca',
      'Valle del Cauca',
      'Magdalena'
    ],
  );

  final selectCity = SelectFieldBloc(
    items: ['Select your city', 'Bogotá DC', 'Cali', 'Barranquilla'],
  );

  @override
  void onLoading() async {
    selectState.updateValue('Select your state');
    selectCity.updateValue('Select your city');
    emitLoaded();
  }

  SelectCityBloc() : super(isLoading: true) {
    addFieldBlocs(fieldBlocs: [selectState, selectCity]);
  }

  @override
  void onSubmitting() async {
    print(selectState.value);
    print(selectCity.value);

    await Future<void>.delayed(Duration(seconds: 1));
    emitSuccess();
  }

  void dispose() {
    selectState.close();
    selectCity.close();
  }
}
