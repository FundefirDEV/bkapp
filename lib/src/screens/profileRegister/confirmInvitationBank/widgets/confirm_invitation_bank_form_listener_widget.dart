import 'package:bkapp_flutter/core/bloc/app_bloc.dart';
import 'package:bkapp_flutter/core/bloc/profileRegisterBloc/profile_register_bloc.dart';
import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/confirm_invitation_bank_step_screen.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/widgets/confirm_invitation_bank_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/header_content.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_next_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ConfirmInvitationBankFormListenerWidget extends StatelessWidget {
  final ConfirmInvitationBankStepArgs data;
  const ConfirmInvitationBankFormListenerWidget({Key key, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FormBlocListener<ProfileRegisterBloc, String, String>(
        onSuccess: (context, state) {
          Navigator.pushNamed(context, selectAddressRoute);
        },
        child: Column(children: <Widget>[
          HeaderContent(
            width: SizeConfig.safeBlockHorizontal * 60,
            firstText: I18n.of(context).confimInvitationBankTitleOne,
            secondText: I18n.of(context).confimInvitationBankTitleTwo,
            subtitle: I18n.of(context).confimInvitationBankSubtitle,
          ),
          Expanded(child: _containerInfo(context))
        ]));
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
                      onTap:
                          context.bloc<AppBloc>().profileRegisterBloc.submit)))
        ]);
  }
}