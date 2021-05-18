import 'dart:async';

import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class InputCode extends StatefulWidget {
  InputCode({Key key, @required this.tag, @required this.image})
      : super(key: key);

  final String tag;
  final String image;

  @override
  _InputCodeState createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  TextEditingController textEditingController = TextEditingController()
    ..text = "";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  String errorText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final registerBloc = context.read<AppBloc>().profileRegisterBloc;
    SizeConfig().init(context);
    return GestureDetector(
      key: Key('input-code-column-gesture-detector'),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        key: Key('input-code-column'),
        children: <Widget>[
          Form(
            key: formKey,
            child: Material(
              key: Key('input-code-material'),
              color: Colors.transparent,
              child: Padding(
                  key: Key('input-code-padding'),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    key: Key('input-code-pin-code'),
                    length: 5,
                    //textInputType: TextInputType.number,
                    //obsecureText: true,
                    animationType: AnimationType.scale,
                    backgroundColor: Colors.transparent,
                    validator: (v) {
                      if (v.length < 3) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      inactiveFillColor: Colors.white,
                      selectedColor: Theme.of(context).colorScheme.grayColor,
                      inactiveColor: Theme.of(context).colorScheme.grayColor,
                      activeColor: Theme.of(context).colorScheme.grayColor,
                      selectedFillColor:
                          Theme.of(context).colorScheme.primaryColor[100],
                      borderWidth: 1,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: SizeConfig.blockSizeVertical * 7,
                      fieldWidth: SizeConfig.blockSizeHorizontal * 12,
                      activeFillColor:
                          hasError ? Colors.red[100] : Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    autoDisposeControllers: false,
                    onCompleted: (v) async {
                      var request = await registerBloc.pinCodeBloc.makeSubmit(
                          email: registerBloc.emailBloc.email.value,
                          phone: registerBloc.phoneBloc.phone.value);
                      request != 'error'
                          ? Navigator.pushNamed(context, registerPasswordUser,
                              arguments: RegisterPasswordStepArgs(
                                  widget.tag, widget.image))
                          : setState(() {
                              hasError = true;
                            });
                    },
                    onChanged: (value) {
                      registerBloc.pinCodeBloc.pincode.updateValue(value);
                      setState(() {
                        hasError = false;
                      });
                    },
                  )),
            ),
          ),
          Padding(
            key: Key('input-code-padding-error-text'),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              hasError
                  ? I18n.of(context).pinCodeVerificationPinCodeComplete
                  : "",
              key: Key('input-code-text-error'),
              style: TextStyle(
                  color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
              key: Key('input-code-rich-text'),
              textAlign: TextAlign.center,
              text: TextSpan(
                text: I18n.of(context).pinCodeVerificationPut,
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: I18n.of(context).pinCodeVerificationTheCode,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: I18n.of(context).pinCodeVerificationWeSendToYour),
                  TextSpan(
                      text: I18n.of(context).pinCodeVerificationCellNumber,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          if (EnvironmentConfig.ENV == 'DEV')
            TextField(
              key: Key('input-code-pin-code-temporal'),
              controller: textEditingController,
              keyboardType: TextInputType.visiblePassword,
            )
        ],
      ),
    );
  }
}
