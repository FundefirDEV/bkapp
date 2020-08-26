import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InviteModalContent {

  Container contactButton({
    @required BuildContext context,
    @required onPressed
  }) {
    return Container(
      key: Key('close_container_invite_modal'),
      child: FlatButton(
        key: Key('flat_button_load_partners'),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add, color: Colors.white),
            Text(
              I18n.of(context).inviteModalFromMyContacts,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container titleContainer(BuildContext context) {
    return Container(
      key: Key('title_container_invite_modal'),
      height: SizeConfig.blockSizeVertical * 6,
      decoration: BoxDecoration(
          color: Colors.yellow[700],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17), topRight: Radius.circular(17))),
      child: Row(children: <Widget>[
        SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
        SvgPicture.asset('assets/images/user_icon.svg'),
        Text(
          I18n.of(context).inviteModalPartner,
          style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 4,
              letterSpacing: 10.0,
              fontWeight: FontWeight.w700),
        ),
      ]),
    );
  }

  Widget closeContainer(BuildContext context) {
    return FlatButton(
      key: Key('close_button_invite_modal'),
      onPressed: () => Navigator.pop(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.close, color: Colors.white, size: 18.0),
          Text(
            I18n.of(context).actionTextClose,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              letterSpacing: 3.0
            ),
          ),
        ],
      )
    );
  }

Widget partnersText(BuildContext context, int partners) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: I18n.of(context).inviteModalYouHave,
          style: TextStyle(color: Colors.grey, fontSize: 17)),
      TextSpan(
          text: '$partners',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          )),
      TextSpan(
          text: I18n.of(context).inviteModalPartners,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          )),
    ]));
  }
}
