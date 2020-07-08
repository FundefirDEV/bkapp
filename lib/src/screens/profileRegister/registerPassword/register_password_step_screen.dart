import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/confirm_invitation_bank_step_screen.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/widgets/register_password_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';

class RegisterPasswordStepScreen extends StatefulWidget {
  final RegisterPasswordStepArgs data;
  RegisterPasswordStepScreen({Key key, this.data}) : super(key: key);

  @override
  _RegisterPasswordStepScreenState createState() =>
      _RegisterPasswordStepScreenState();
}

class _RegisterPasswordStepScreenState
    extends State<RegisterPasswordStepScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(child: SafeArea(child: _containerInfo()));
  }

  Widget _containerInfo() {
    return Column(
        key: Key('column-register-password'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonBackWidget(),
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: RegisterPasswordContainerWidget(
                    tag: widget.data.tag, image: widget.data.image),
              )),
          Expanded(
              child: FooterStepWidget(
            currentStep: 5,
            numberOfSteps: 5,
            route: confirmInvitationBank,
            currentBlocSubmit:
                context.bloc<AppBloc>().profileRegisterBloc.passwordBloc.submit,
            renderNextWidget: ConfirmInvitationBankStepArgs(
                widget.data.tag, widget.data.image),
          ))
        ]);
  }
}

class RegisterPasswordStepArgs {
  final String tag;
  final String image;

  RegisterPasswordStepArgs(this.tag, this.image);
}
