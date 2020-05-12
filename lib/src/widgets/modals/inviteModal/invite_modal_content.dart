import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InviteModalContent {
  Container closeContainer(BuildContext context) {
    return Container(
      key: Key('close_container_invite_modal'),
      child: FlatButton(
        key: Key('close_button_invite_modal'),
        onPressed: () => Navigator.pop(context),
        child: Row(
          children: <Widget>[
            SizedBox(width: SizeConfig.blockSizeHorizontal * 22),
            Icon(Icons.close, color: Colors.white),
            Text(I18n.of(context).actionTextClose,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 3.0,
                )),
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
          border: Border.all(width: 0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17), topRight: Radius.circular(17))),
      child: Row(children: <Widget>[
        SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
        SvgPicture.asset('assets/images/user_icon.svg'),
        SizedBox(width: SizeConfig.safeBlockHorizontal * 15),
        Text(
          I18n.of(context).inviteModalPartner,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 10.0,
              fontWeight: FontWeight.w700),
        ),
      ]),
    );
  }

  Container contactButton(BuildContext context) {
    return Container(
      child: FlatButton(
        key: Key('contact_nutton_invite_modal'),
        onPressed: () => {},
        child: Row(
          children: <Widget>[
            SizedBox(width: SizeConfig.blockSizeHorizontal * 15),
            Icon(Icons.add, color: Colors.white),
            Text(
              I18n.of(context).inviteModalFromMyContacts,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

RichText partnersText(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: I18n.of(context).inviteModalYouHave,
          style: TextStyle(color: Colors.grey, fontSize: 17)),
      TextSpan(
          text: '6', //TODO convert to variable
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
