import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/user_data_header_information.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/widgets/modals/ImageBottomModal/Image_bottom_modal.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:flutter/material.dart';

import '../../screens.dart';

class PinCodeStepScreen extends StatefulWidget {
  final RegisterPinCodeScreenStepArgs data;
  PinCodeStepScreen({Key key, this.data}) : super(key: key);

  @override
  _PinCodeStepScreenState createState() => _PinCodeStepScreenState();
}

class _PinCodeStepScreenState extends State<PinCodeStepScreen> {
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
    SizeConfig().init(context);
    return Material(
      child: BlocProvider(
        create: (context) =>
            context.bloc<AppBloc>().profileRegisterBloc.pinCodeBloc,
        child: Builder(builder: (context) {
          return FormBlocListener<ProfilePinCodeVerificationBloc, String,
                  String>(
              key: Key('bloc-listener-pincode-verification'),
              onSubmitting: (context, state) {
                print('Loading');
              },
              onSuccess: (context, state) {
                setState(() => {
                      validationCode =
                          I18n().pinCodeVerificationGoodCodeMessage,
                      colorText = Colors.green
                    });
              },
              onFailure: (context, state) {
                setState(() => {
                      validationCode =
                          I18n().pinCodeVerificationErrorCodeMessage,
                      colorText = Colors.red
                    });
              },
              child:
                  SafeArea(child: _containerInfo(validationCode, colorText)));
        }),
      ),
    );
  }

  Widget _containerInfo(validationCode, colorText) {
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
          Expanded(
              key: Key('expanded-footer-pin-code-verification'),
              child: FooterStepWidget(
                currentStep: 4,
                numberOfSteps: 5,
                route: registerPasswordUser,
                currentBlocSubmit: context
                    .bloc<AppBloc>()
                    .profileRegisterBloc
                    .pinCodeBloc
                    .submit,
                renderNextWidget: RegisterPasswordStepArgs(
                    widget.data.tag, widget.data.image),
              ))
        ]);
  }
}

class RegisterPinCodeScreenStepArgs {
  final String tag;
  final String image;

  RegisterPinCodeScreenStepArgs(this.tag, this.image);
}
