import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/widgets/register_phone_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:flutter/material.dart';

class RegisterPhoneStepScreen extends StatefulWidget {
  final RegisterPhoneStepArgs data;
  RegisterPhoneStepScreen({Key key, this.data}) : super(key: key);

  @override
  _RegisterPhoneStepScreenState createState() =>
      _RegisterPhoneStepScreenState();
}

class _RegisterPhoneStepScreenState extends State<RegisterPhoneStepScreen> {
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
                child: RegisterPhoneContainerWidget(
                    tag: widget.data.tag, image: widget.data.image),
              )),
          Expanded(
              child: FooterStepWidget(
            currentStep: 3,
            numberOfSteps: 4,
            route: registerEmailUser,
            renderNextWidget:
                RegisterEmailStepArgs(widget.data.tag, widget.data.image),
          ))
        ]);
  }
}

class RegisterPhoneStepArgs {
  final String tag;
  final String image;

  RegisterPhoneStepArgs(this.tag, this.image);
}
