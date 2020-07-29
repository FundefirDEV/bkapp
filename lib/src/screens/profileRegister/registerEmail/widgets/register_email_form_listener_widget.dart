import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_email_bloc.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/widgets/register_email_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/register_phone_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterEmailFormListenerWidget extends StatelessWidget {
  final RegisterEmailStepArgs data;
  const RegisterEmailFormListenerWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBlocListener<ProfileEmailBloc, String, String>(
        onSuccess: (context, state) {
          Navigator.pushNamed(context, registerPhoneUser,
              arguments: RegisterPhoneStepArgs(data.tag, data.image));
        },
        child: _containerInfo(context));
  }

  Widget _containerInfo(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonBackWidget(),
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: RegisterEmailContainerWidget(
                    tag: data.tag, image: data.image),
              )),
          FooterStepWidget(
              currentStep: 2,
              numberOfSteps: 5,
              currentBlocSubmit:
                  context.bloc<AppBloc>().profileRegisterBloc.emailBloc.submit)
        ]);
  }
}
