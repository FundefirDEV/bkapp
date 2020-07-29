import 'package:bkapp_flutter/src/screens/profileRegister/registerPhone/widgets/register_phone_form_listener_widget.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';

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
    return BlocProvider(
      create: (context) =>
          context.bloc<AppBloc>().profileRegisterBloc.phoneBloc,
      child: Builder(builder: (context) {
        return Material(
          child: SafeArea(
              child: RegisterPhoneFormListenerWidget(data: widget.data)),
        );
      }),
    );
  }
}

class RegisterPhoneStepArgs {
  final String tag;
  final String image;

  RegisterPhoneStepArgs(this.tag, this.image);
}
