import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/widgets/register_email_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/register_phone_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterEmailFormListenerWidget extends StatefulWidget {
  final RegisterEmailStepArgs data;
  const RegisterEmailFormListenerWidget({Key key, this.data}) : super(key: key);

  @override
  _RegisterEmailFormListenerWidgetState createState() =>
      _RegisterEmailFormListenerWidgetState();
}

class _RegisterEmailFormListenerWidgetState
    extends State<RegisterEmailFormListenerWidget> {
  bool isDisabled = true;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RegisterEmailContainerWidget(
            tag: widget.data.tag,
            image: widget.data.image,
            isValidating: _isValidating,
          ),
          FooterStepWidget(
              currentStep: 2,
              numberOfSteps: 5,
              isDisabled: isDisabled,
              currentBlocSubmit: () {
                Navigator.pushNamed(context, registerPhoneUser,
                    arguments: RegisterPhoneStepArgs(
                        widget.data.tag, widget.data.image));
              })
        ]);
  }

  _isValidating(ProfileEmailBloc emailBloc) {
    FieldBlocValidators.email(emailBloc.email.value) == null &&
            emailBloc.email.value.length > 5
        ? setState(() => isDisabled = false)
        : setState(() => isDisabled = true);
  }
}
