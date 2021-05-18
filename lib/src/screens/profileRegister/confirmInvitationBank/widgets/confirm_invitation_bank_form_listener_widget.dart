import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/confirm_invitation_bank_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/widgets/confirm_invitation_bank_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/header_content.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_next_widget.dart';

class ConfirmInvitationBankFormListenerWidget extends StatelessWidget {
  final ConfirmInvitationBankStepArgs data;
  const ConfirmInvitationBankFormListenerWidget({Key key, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(children: <Widget>[
      HeaderContent(
        width: SizeConfig.safeBlockHorizontal * 60,
        firstText: I18n.of(context).confimInvitationBankTitleOne,
        secondText: I18n.of(context).confimInvitationBankTitleTwo,
        subtitle: I18n.of(context).confimInvitationBankSubtitle,
      ),
      Expanded(child: _containerInfo(context))
    ]);
  }

  Widget _containerInfo(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: ConfirmInvitationBankContainerWidget(
                    tag: data.tag, image: data.image),
              )),
          Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockVertical * 3,
                      vertical: SizeConfig.safeBlockVertical * 5),
                  child: ButtonNextWidget(
                      key: Key('btn-rigth-confirm-invitation-bank'),
                      onTap: () {
                        if (data.isInivted) {
                          _clearInputs(context);
                          Navigator.pushNamed(context, loginRoute);
                        } else {
                          Navigator.pushNamed(context, selectAddressRoute);
                        }
                      })))
        ]);
  }

  void _clearInputs(BuildContext context) {
    context.read<AppBloc>().profileRegisterBloc.nameBloc.clear();
    context.read<AppBloc>().profileRegisterBloc.emailBloc.clear();
    context.read<AppBloc>().profileRegisterBloc.phoneBloc.clear();
    context.read<AppBloc>().profileRegisterBloc.password.clear();
    context.read<AppBloc>().profileRegisterBloc.passwordConfirm.clear();
  }
}
