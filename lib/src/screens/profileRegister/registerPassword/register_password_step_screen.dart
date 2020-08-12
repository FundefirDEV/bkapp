import 'package:bkapp_flutter/src/screens/profileRegister/registerPassword/widgets/register_password_form_listener.dart';
import 'package:bkapp_flutter/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';

class RegisterPasswordStepScreen extends StatefulWidget {
  final RegisterPasswordStepArgs data;
  RegisterPasswordStepScreen({Key key, this.data}) : super(key: key);

  @override
  _RegisterPasswordStepScreenState createState() =>
      _RegisterPasswordStepScreenState();
}

class _RegisterPasswordStepScreenState
    extends State<RegisterPasswordStepScreen> {
  Offset position =Offset(40.0, 40.0);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) =>
          context.bloc<AppBloc>().profileRegisterBloc.passwordBloc,
      child: Builder(builder: (context) {
        return Material(
            child: SafeArea(
                child: Stack(
                  children: <Widget>[
                    RegisterPasswordFormListenerWidget(data: widget.data),
                    MenuRequests(
                      position: position,
                      onDragEnd: (details) {
                        setState(() => position = details.offset);
                      }
                    )
                  ],
                )
            )
        );
      }),
    );
  }
}

class RegisterPasswordStepArgs {
  final String tag;
  final String image;

  RegisterPasswordStepArgs(this.tag, this.image);
}
