import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter_svg/svg.dart';

class DeletePartnersText extends StatelessWidget {
  const DeletePartnersText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Column(
          key: Key('column_delete_partner_modal_text'),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildRichText(context),
            Container(
                margin:
                    EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 10),
                child: SvgPicture.asset('assets/images/sad_bot.svg',
                    key: Key('image_delete_partner_modal_text'))),
          ],
        ));
  }

  RichText buildRichText(context) {
    return RichText(
        key: Key('richText_delete_partner_modal'),
        textAlign: TextAlign.center,
        text: TextSpan(
            text: I18n.of(context).deletePartnerModalAreYouSure + '\n',
            style: TextStyle(
              color: Theme.of(context).colorScheme.grayColor,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: I18n.of(context).deletePartnerModalDeletePartner,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ]));
  }
}
