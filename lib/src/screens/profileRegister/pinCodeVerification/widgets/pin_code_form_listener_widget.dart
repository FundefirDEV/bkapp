import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/pin_code_verification.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/user_data_header_information.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
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
  bool isDisabled = true;
  Offset position =Offset(40.0, 40.0);

  @override
  void initState() {
    super.initState();
    validationCode = '';
    colorText = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Column(
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
                isDisabled: isDisabled,
                currentBlocSubmit: context
                    .bloc<AppBloc>()
                    .profileRegisterBloc
                    .pinCodeBloc
                    .submit)
          ]),
          MenuRequests(
            position: position,
            onDragEnd: (details) {
              setState(() => position = details.offset);
            }
          )
        ],
      )
    );
  }
}
