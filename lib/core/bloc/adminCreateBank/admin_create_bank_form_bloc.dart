import 'package:bkapp_flutter/core/models/models.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/admin_create_bank_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AdminCreateBankFormBloc extends FormBloc<dynamic, dynamic> {
  AdminCreateBankFormBloc({@required this.repository}) {}

  final AdminCreateBankRepository repository;

  @override
  void onSubmitting() async {
    emitSuccess(canSubmitAgain: true);
  }

  Future<void> close() {
    return super.close();
  }
}
