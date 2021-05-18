import 'package:bkapp_flutter/src/screens/profileRegister/registerEmail/widgets/register_email_form_listener_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterEmailStepScreen extends StatefulWidget {
  final RegisterEmailStepArgs data;
  RegisterEmailStepScreen({Key key, this.data}) : super(key: key);

  @override
  _RegisterEmailStepScreenState createState() =>
      _RegisterEmailStepScreenState();
}

class _RegisterEmailStepScreenState extends State<RegisterEmailStepScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (context) =>
            context.read<AppBloc>().profileRegisterBloc.emailBloc,
        child: Builder(builder: (context) {
          return Scaffold(
            body: SafeArea(
                child: Container(
              child: Column(
                children: [
                  ButtonBackWidget(),
                  Expanded(
                      child: SingleChildScrollView(
                          child: RegisterEmailFormListenerWidget(
                              data: widget.data))),
                ],
              ),
            )),
          );
        }));
  }
}

class RegisterEmailStepArgs {
  final String tag;
  final String image;

  RegisterEmailStepArgs(this.tag, this.image);
}
