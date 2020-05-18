import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerName/widgets/register_name_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/header_content.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class RegisterNameStepScreen extends StatefulWidget {
  final RegisterNameStepArgs data;
  RegisterNameStepScreen({Key key, this.data}) : super(key: key);
  @override
  _RegisterNameStepScreenState createState() => _RegisterNameStepScreenState();
}

class _RegisterNameStepScreenState extends State<RegisterNameStepScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
        child: SafeArea(
            child: Column(
      children: <Widget>[
        HeaderContent(
          width: SizeConfig.safeBlockHorizontal * 60,
          firstText: I18n.of(context).registerNameTitle,
          firstFontWeight: FontWeight.w300,
        ),
        Expanded(child: _containerInfo())
      ],
    )));
  }

  Widget _containerInfo() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: RegisterNameContainerWidget(
                    tag: widget.data.tag, image: widget.data.image),
              )),
          Expanded(
              child: FooterStepWidget(
            currentStep: 1,
            numberOfSteps: 4,
            route: registerEmailUser,
            renderNextWidget:
                RegisterEmailStepArgs(widget.data.tag, widget.data.image),
          ))
        ]);
  }
}

class RegisterNameStepArgs {
  final String tag;
  final String image;

  RegisterNameStepArgs(this.tag, this.image);
}
