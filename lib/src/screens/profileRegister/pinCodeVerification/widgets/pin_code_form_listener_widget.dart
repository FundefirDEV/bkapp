import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/pin_code_verification.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/user_data_header_information.dart';
import 'package:flutter/material.dart';

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
    return Column(
        key: Key('column-pin-code-verification'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          UserDataHeaderInformation(
              tag: widget.data.tag, image: widget.data.image),
          Text(
            validationCode,
            key: Key('text-response-submit-pincode'),
            style: TextStyle(color: colorText),
          ),
        ]);
  }
}
