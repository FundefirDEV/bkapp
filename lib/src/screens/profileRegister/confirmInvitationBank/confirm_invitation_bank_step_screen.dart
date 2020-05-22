import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/routes/route_constants.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/confirmInvitationBank/widgets/confirm_invitation_bank_container_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/footerSteps/footer_step_widget.dart';
import 'package:bkapp_flutter/src/screens/profileRegister/widgets/header_content.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardWidget/button_next_widget.dart';
import 'package:flutter/material.dart';

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
    return Material(
      child: SafeArea(
          child: Column(
        children: <Widget>[
          HeaderContent(
            width: SizeConfig.safeBlockHorizontal * 60,
            firstText: I18n.of(context).confimInvitationBankTitleOne,
            secondText: I18n.of(context).confimInvitationBankTitleTwo,
            subtitle: I18n.of(context).confimInvitationBankSubtitle,
          ),
          Expanded(child: _containerInfo())
        ],
      )),
    );
  }

  Widget _containerInfo() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: ConfirmInvitationBankContainerWidget(
                    tag: widget.data.tag, image: widget.data.image),
              )),
          Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockVertical * 3,
                      vertical: SizeConfig.safeBlockVertical * 5),
                  child: ButtonNextWidget(onTap: () {})))
        ]);
  }
}

class ConfirmInvitationBankStepArgs {
  final String tag;
  final String image;

  ConfirmInvitationBankStepArgs(this.tag, this.image);
}
