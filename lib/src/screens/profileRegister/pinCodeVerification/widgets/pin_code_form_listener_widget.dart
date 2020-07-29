import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_pin_code_verification_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/pin_code_verification.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/user_data_header_information.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/register_password_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PinCodeFormListenerWidget extends StatefulWidget {
  final RegisterPinCodeScreenStepArgs data;
  const PinCodeFormListenerWidget({Key key, this.data}) : super(key: key);

  @override
  _PinCodeFormListenerState createState() => _PinCodeFormListenerState();
}

class _PinCodeFormListenerState extends State<PinCodeFormListenerWidget> {
  String validationCode;
  Color colorText;

  @override
  void initState() {
    super.initState();
    validationCode = '';
    colorText = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return FormBlocListener<ProfilePinCodeVerificationBloc, String, String>(
        key: Key('bloc-listener-pincode-verification'),
        onSubmitting: (context, state) {
          CircularProgressIndicator();
        },
        onSuccess: (context, state) {
          Navigator.pushNamed(context, registerPasswordUser,
              arguments:
                  RegisterPasswordStepArgs(widget.data.tag, widget.data.image));
        },
        onFailure: (context, state) {
          setState(() => {
                validationCode = I18n().pinCodeVerificationErrorCodeMessage,
                colorText = Colors.red
              });
        },
        child: SafeArea(
            child: _containerInfo(context, validationCode, colorText)));
  }

  Widget _containerInfo(BuildContext context, validationCode, colorText) {
    return Column(
        key: Key('column-pin-code-verification'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonBackWidget(),
          Expanded(
              key: Key('expanded-content-pin-code-verification'),
              flex: 2,
              child: SingleChildScrollView(
                child: UserDataHeaderInformation(
                    tag: widget.data.tag, image: widget.data.image),
              )),
          Text(
            validationCode,
            key: Key('text-response-submit-pincode'),
            style: TextStyle(color: colorText),
          ),
          FooterStepWidget(
              currentStep: 4,
              numberOfSteps: 5,
              currentBlocSubmit: context
                  .bloc<AppBloc>()
                  .profileRegisterBloc
                  .pinCodeBloc
                  .submit)
        ]);
  }
}
