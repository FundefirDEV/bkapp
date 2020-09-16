import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ExemptionsFormBloc extends FormBloc<String, String> {
  final selectPartnerExemption = SelectFieldBloc(
    items: ['Falcao Garcia', 'James Rodriguez', 'Juan Cuadrado'],
  );
  @override
  void onLoading() async {
    try {
      emitLoaded();
    } catch (e) {
      emitLoadFailed();
    }
  }

  ExemptionsFormBloc() : super(isLoading: true) {
    addFieldBlocs(fieldBlocs: [
      selectPartnerExemption,
    ]);
  }

  @override
  void onSubmitting() async {
    emitSuccess();
  }

  void dispose() {
    selectPartnerExemption.close();
  }
}
