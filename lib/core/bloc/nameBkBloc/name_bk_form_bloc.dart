import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class NameBkBloc extends FormBloc<String, String> {

  final namebk = TextFieldBloc();

  NameBkBloc() {
    addFieldBlocs(
      fieldBlocs: [
        namebk
      ]
    );
  }

  @override
  void onSubmitting() async {
    print(namebk.value);

    await Future<void>.delayed(Duration(seconds: 1));

    emitSuccess();
  }

  void dispose() {
    namebk.close();
  }
}
