import 'dart:async';
import 'package:bkapp_flutter/core/bloc/changePassbloc/change_pass_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/screens/menuNavigator/bloc_providers.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class InputCode extends StatefulWidget {

  final ChangePassBloc changePassBloc;
  InputCode({@required this.changePassBloc});

  @override
  _InputCodeState createState() => _InputCodeState(changePassBloc);
}

class _InputCodeState extends State<InputCode> {
  
  final ChangePassBloc changePassBloc;
  _InputCodeState(this.changePassBloc);

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
    //final registerBloc = context.read<AppBloc>().profileRegisterBloc;
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
                      print(v);
                    },
                    onChanged: (value) {
                      changePassBloc.changePincode(value);
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
            child: StreamBuilder(
              stream: changePassBloc.pincodeStream,
              builder: (BuildContext context , AsyncSnapshot snapshot){
                return  Text(
                  snapshot.hasError ?
                    snapshot.error 
                    : "",
                  key: Key('input-code-text-error'),
                  style: TextStyle(
                    color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
                );
              },          
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
              key: Key('input-code-rich-text'),
              textAlign: TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: I18n.of(context).changePasswordSendTheCode,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: I18n.of(context).changePasswordToYourEmail),
                  TextSpan(
                      text: I18n.of(context).changePasswordPleaseCheck,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          // if (EnvironmentConfig.ENV == 'DEV')
          //   TextField(
          //     key: Key('input-code-pin-code-temporal'),
          //     controller: textEditingController,
          //     keyboardType: TextInputType.visiblePassword,
          //   )
        ],
      ),
    );
  }
}
