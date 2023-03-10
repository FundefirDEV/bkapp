import 'dart:async';
import 'package:bkapp_flutter/core/models/location_model.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/admin_create_bank_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

part 'admin_create_bank_event.dart';
part 'admin_create_bank_state.dart';

class AdminCreateBankBloc
    extends Bloc<AdminCreateBankEvent, AdminCreateBankState> {
  AdminCreateBankBloc({@required this.repository})
      : super(AdminCreateBankInitial());
  final AdminCreateBankRepository repository;

  List<dynamic> locations = [];
  List<String> department = [];
  List<dynamic> locationModel = [];
  final listCountry = AddFieldBlocItem([]);

  @override
  Stream<AdminCreateBankState> mapEventToState(
    AdminCreateBankEvent event,
  ) async* {
    if (event is AdminCreateBankInitialize) {
      yield AdminCreateBankLoading();
      try {
        final response = await repository.getLocation(token: event.token);
        locationModel = locationModelFromJson(response);

        yield AdminCreateBankInitial();
      } catch (e) {
        print(e);
        yield AdminCreateBankFailure(error: e.toString());
      }
    }
  }
}
