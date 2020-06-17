import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/widgets/register_email_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/register_phone_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterEmailStepScreen extends StatefulWidget {
  final RegisterEmailStepArgs data;
  RegisterEmailStepScreen({Key key, this.data}) : super(key: key);

  @override
  _RegisterEmailStepScreenState createState() =>
      _RegisterEmailStepScreenState();
}

class _RegisterEmailStepScreenState extends State<RegisterEmailStepScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(child: SafeArea(child: _containerInfo()));
  }

  Widget _containerInfo() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonBackWidget(),
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: RegisterEmailContainerWidget(
                  tag: widget.data.tag,
                  image: widget.data.image
                ),
              )),
          Expanded(
              child: FooterStepWidget(
            currentStep: 2,
            numberOfSteps: 4,
            route: registerPhoneUser,
            currentBlocSubmit:
              context.bloc<AppBloc>().profileRegisterBloc.emailBloc.submit,
            renderNextWidget:
                RegisterPhoneStepArgs(widget.data.tag, widget.data.image),
          ))
        ]);
  }
}

class RegisterEmailStepArgs {
  final String tag;
  final String image;

  RegisterEmailStepArgs(this.tag, this.image);
}
