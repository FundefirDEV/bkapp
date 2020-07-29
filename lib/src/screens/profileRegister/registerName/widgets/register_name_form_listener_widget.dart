import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_name_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerName/widgets/register_name_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/header_content.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../register_name_step_screen.dart';

class RegisterNameFormListenerWidget extends StatelessWidget {
  final RegisterNameStepArgs data;
  const RegisterNameFormListenerWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FormBlocListener<ProfileNameBloc, String, String>(
        onSuccess: (context, state) {
          Navigator.pushNamed(context, registerEmailUser,
              arguments: RegisterEmailStepArgs(
                data.tag,
                data.image,
              ));
        },
        child: Column(
          children: <Widget>[
            HeaderContent(
              width: SizeConfig.safeBlockHorizontal * 60,
              firstText: I18n.of(context).registerNameTitle,
              firstFontWeight: FontWeight.w300,
            ),
            Expanded(child: _containerInfo(context))
          ],
        ));
  }

  Widget _containerInfo(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: RegisterNameContainerWidget(
                    tag: data.tag, image: data.image),
              )),
          FooterStepWidget(
              currentStep: 1,
              numberOfSteps: 5,
              currentBlocSubmit:
                  context.bloc<AppBloc>().profileRegisterBloc.nameBloc.submit)
        ]);
  }
}
