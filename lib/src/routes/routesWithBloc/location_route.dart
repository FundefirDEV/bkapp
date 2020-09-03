import 'package:bkapp_flutter/core/bloc/bankRegisterBloc/select_city_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

Widget locationRouteBloc() {
  return BlocProvider<SelectCityBloc>(
    create: (context) => SelectCityBloc(repository: locationRepository),
    child: SelectCityScreen(),
  );
}
