import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_register_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/confirm_invitation_bank_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/register_password_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/widgets/register_password_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterPasswordFormListenerWidget extends StatefulWidget {
  final RegisterPasswordStepArgs data;
  const RegisterPasswordFormListenerWidget({Key key, this.data})
      : super(key: key);

  @override
  _RegisterPasswordFormListenerWidgetState createState() =>
      _RegisterPasswordFormListenerWidgetState();
}

class _RegisterPasswordFormListenerWidgetState
    extends State<RegisterPasswordFormListenerWidget> {
  bool isDisabled = true;
  String confirmPassword = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return FormBlocListener<ProfileRegisterBloc, String, String>(
        onSubmitting: (context, state) {
          CircularProgressIndicator();
        },
        child: _containerInfo(context));
  }

  Widget _containerInfo(BuildContext context) {
    // ignore: close_sinks
    final _bankRegisterBloc = context.read<AppBloc>().bankRegisterBloc;
    return Column(
        key: Key('column-register-password'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RegisterPasswordContainerWidget(
              tag: widget.data.tag,
              image: widget.data.image,
              isValidating: _isValidating,
              validateSecondPassword: _validateSecondPassword),
          FooterStepWidget(
              currentStep: 5,
              numberOfSteps: 5,
              isDisabled: isDisabled,
              currentBlocSubmit: () async {
                setState(() { });
                try {
                  RegisterUserModel result = await context
                      .read<AppBloc>()
                      .profileRegisterBloc
                      .makeSubmit();
                  _bankRegisterBloc.token.updateValue(result.token);
                  _bankRegisterBloc.clearData();
                  
                  Navigator.pushNamed(context, confirmInvitationBank,
                      arguments: ConfirmInvitationBankStepArgs(widget.data.tag,
                          widget.data.image, result.isInvited));
                } catch (e) {
                  _showMaterialDialog(e.toString());
                }
                setState(() { });
              })
        ]);
  }

  _showMaterialDialog(String error) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text(I18n.of(context).requestErrorUserNotAvailable),
              content: new Text(error),
              actions: <Widget>[
                FlatButton(
                  child: Text(I18n.of(context).actionTextClose),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  _changeState(bool validation) {
    validation
        ? setState(() => isDisabled = false)
        : setState(() => isDisabled = true);
  }

  _validateSecondPassword(String value) {
    setState(() => password = value);
    _changeState(confirmPassword.length > 5 && value == confirmPassword);
  }

  _isValidating(String value) {
    setState(() => confirmPassword = value);
    _changeState(value.length > 5 && value == password);
  }
}
