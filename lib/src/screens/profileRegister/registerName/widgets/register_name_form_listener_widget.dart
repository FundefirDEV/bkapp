import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/register_email_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerName/widgets/register_name_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/header_content.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../register_name_step_screen.dart';

class RegisterNameFormListenerWidget extends StatefulWidget {
  final RegisterNameStepArgs data;
  const RegisterNameFormListenerWidget({Key key, this.data}) : super(key: key);

  @override
  _RegisterNameFormListenerWidgetState createState() =>
      _RegisterNameFormListenerWidgetState();
}

class _RegisterNameFormListenerWidgetState
    extends State<RegisterNameFormListenerWidget> {
  bool isDisabled = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(children: [
      HeaderContent(
        width: SizeConfig.safeBlockHorizontal * 60,
        paddingTop: 10,
        firstText: I18n.of(context).registerNameTitle,
        firstFontWeight: FontWeight.w300,
      ),
      RegisterNameContainerWidget(
        tag: widget.data.tag,
        image: widget.data.image,
        isDiabled: _isValidating,
      ),
      FooterStepWidget(
          currentStep: 1,
          numberOfSteps: 5,
          isDisabled: isDisabled,
          currentBlocSubmit: () {
            Navigator.pushNamed(context, registerEmailUser,
                arguments:
                    RegisterEmailStepArgs(widget.data.tag, widget.data.image));
          })
    ]);
  }

  _isValidating(ProfileNameBloc nameBloc) {
    nameBloc.firstName.value.length > 1 && nameBloc.secondName.value.length > 1
        ? setState(() => isDisabled = false)
        : setState(() => isDisabled = true);
  }
}
