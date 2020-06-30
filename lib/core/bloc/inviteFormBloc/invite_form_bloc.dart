import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class InviteFormBloc extends FormBloc<String, String> {

  final name = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );
  final cellPhone = TextFieldBloc(
    validators: [FieldBlocValidators.required]
  );

  InviteFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        name,
        cellPhone
      ]
    );
  }

  @override
  void onSubmitting() async {
    print(name.value);
    print(cellPhone.value);

    await Future<void>.delayed(Duration(seconds: 1));

    emitSuccess();
  }

  void dispose() {
    name.close();
    cellPhone.close();
  }
}
