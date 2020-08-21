import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/widgets/confirm_invitation_bank_form_listener_widget.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ConfirmInvitationBankStepScreen extends StatefulWidget {
  final ConfirmInvitationBankStepArgs data;
  ConfirmInvitationBankStepScreen({Key key, this.data}) : super(key: key);

  @override
  _ConfirmInvitationBankStepScreenState createState() =>
      _ConfirmInvitationBankStepScreenState();
}

class _ConfirmInvitationBankStepScreenState
    extends State<ConfirmInvitationBankStepScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (context) => context.bloc<AppBloc>().profileRegisterBloc,
        child: Builder(builder: (context) {
          return Material(
              child: SafeArea(
                  child: ConfirmInvitationBankFormListenerWidget(
                      data: widget.data)));
        }));
  }
}

class ConfirmInvitationBankStepArgs {
  final String tag;
  final String image;
  final bool isInivted;

  ConfirmInvitationBankStepArgs(this.tag, this.image, this.isInivted);
}
