import 'package:bkapp_flutter/src/screens/profileRegister/pinCodeVerification/widgets/pin_code_form_listener_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_back_widget.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

class PinCodeStepScreen extends StatelessWidget {
  final RegisterPinCodeScreenStepArgs data;
  PinCodeStepScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool isDisabled = true;
    return BlocProvider(
      create: (context) =>
          context.bloc<AppBloc>().profileRegisterBloc.pinCodeBloc,
      child: Builder(builder: (context) {
        return Material(
          child: SafeArea(
              child: Column(
            children: [
              // MenuRequests(
              //     position: position,
              //     onDragEnd: (details) {
              //       position = details.offset;
              //     }),
              ButtonBackWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PinCodeFormListenerWidget(data: data),
                    ],
                  ),
                ),
                flex: 3,
              ),
              Expanded(
                child: FooterStepWidget(
                    currentStep: 4,
                    numberOfSteps: 5,
                    isDisabled: isDisabled,
                    currentBlocSubmit: context
                        .bloc<AppBloc>()
                        .profileRegisterBloc
                        .pinCodeBloc
                        .submit),
              )
            ],
          )),
        );
      }),
    );
  }
}

class RegisterPinCodeScreenStepArgs {
  final String tag;
  final String image;

  RegisterPinCodeScreenStepArgs(this.tag, this.image);
}
