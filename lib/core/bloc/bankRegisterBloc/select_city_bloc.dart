import 'package:bkapp_flutter/core/models/location_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/location_repository.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class SelectCityBloc extends FormBloc<String, String> {
  final LocationRepository repository;
  final selectState = SelectFieldBloc(
    items: [''],
  );

  final selectCity = SelectFieldBloc(
    items: [''],
  );

  final listCountry = AddFieldBlocItem([]);

  SelectCityBloc({this.repository}) : super(isLoading: true) {
    addFieldBlocs(fieldBlocs: [selectState, selectCity]);
    selectState.onValueChanges(onData: (previous, current) async* {
      if (selectState.value != null) {
        List<String> city = [];
        final selectCountry = listCountry.item[0];
        final departments = selectCountry.departaments
            .where((c) => c.name == current.value)
            .first;
        departments.cities.forEach((value) {
          city.add(value.name);
        });
        if (city.length > 0) {
          selectCity.updateItems(city);
        }
      }
    });
  }

  @override
  void onLoading() async {
    selectState.updateValue('');
    selectCity.updateValue('');
    emitLoaded();
  }

  @override
  void onSubmitting() async {
    await Future<void>.delayed(Duration(seconds: 1));
    emitSuccess();
  }

  Future getLocation(String token, String countyCode) async {
    try {
      listCountry.item.clear();
      List<String> department = [];
      final response = await repository.getLocation(token: token);
      List<dynamic> locationModel = locationModelFromJson(response);
      final country = locationModel.where((l) => l.code == countyCode).first;
      listCountry.item.add(country);
      country.departaments.forEach((dep) {
        department.add(dep.name);
      });
      if (department.length > 0) {
        selectState.updateItems(department);
      }
    } catch (e) {
      emitFailure(failureResponse: e.message);
    }
  }

  Future<void> dispose() {
    selectState.close();
    selectCity.close();
    return super.close();
  }
}
