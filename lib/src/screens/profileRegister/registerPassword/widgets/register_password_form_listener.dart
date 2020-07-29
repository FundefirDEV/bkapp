import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_password_bloc.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/confirm_invitation_bank_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/register_password_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/widgets/register_password_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterPasswordFormListenerWidget extends StatelessWidget {
  final RegisterPasswordStepArgs data;
  const RegisterPasswordFormListenerWidget({Key key, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBlocListener<ProfilePasswordBloc, String, String>(
        onSubmitting: (context, state) {
          CircularProgressIndicator();
        },
        onSuccess: (context, state) {
          Navigator.pushNamed(context, confirmInvitationBank,
              arguments: ConfirmInvitationBankStepArgs(data.tag, data.image));
        },
        child: _containerInfo(context));
  }

  Widget _containerInfo(BuildContext context) {
    return Column(
        key: Key('column-register-password'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 60),
                child: SingleChildScrollView(
                  child: RegisterPasswordContainerWidget(
                      tag: data.tag, image: data.image),
                ),
              )),
          FooterStepWidget(
              currentStep: 5,
              numberOfSteps: 5,
              currentBlocSubmit: context
                  .bloc<AppBloc>()
                  .profileRegisterBloc
                  .passwordBloc
                  .submit)
        ]);
  }
}
