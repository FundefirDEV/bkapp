import 'package:bkapp_flutter/src/screens/profileRegister/registerName/widgets/register_name_form_listener_widget.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';

class RegisterNameStepScreen extends StatefulWidget {
  final RegisterNameStepArgs data;
  RegisterNameStepScreen({Key key, this.data}) : super(key: key);
  @override
  _RegisterNameStepScreenState createState() => _RegisterNameStepScreenState();
}

class _RegisterNameStepScreenState extends State<RegisterNameStepScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (context) =>
            context.bloc<AppBloc>().profileRegisterBloc.nameBloc,
        child: Builder(builder: (context) {
          return Scaffold(
              body: SafeArea(
                  child: Container(
                      child: Column(children: [
            ButtonBackWidget(),
            Expanded(
              child: SingleChildScrollView(
                  child: RegisterNameFormListenerWidget(data: widget.data)),
            )
          ]))));
        }));
  }
}

class RegisterNameStepArgs {
  final String tag;
  final String image;

  RegisterNameStepArgs(this.tag, this.image);
}
