import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextImageCreditStatusWidget extends StatelessWidget {
  const TextImageCreditStatusWidget({Key key, this.textBuyShares})
      : super(key: key);

  final bool textBuyShares;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      key: Key('text-image-credit-column'),
      children: <Widget>[
        Container(
          key: Key('text-image-credit-container'),
          height: SizeConfig.safeBlockHorizontal * 1,
          width: SizeConfig.safeBlockHorizontal * 12,
          margin: EdgeInsets.only(
              top: SizeConfig.safeBlockVertical * 4,
              bottom: SizeConfig.safeBlockVertical * 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
        ),
        typeBuyText(context),
        Container(
            key: Key('text-image-credit-container-image'),
            width: SizeConfig.blockSizeHorizontal * 40,
            margin: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 5),
            child: SvgPicture.asset('assets/images/group_102.svg',
                key: Key('text-image-credit-image'), fit: BoxFit.contain))
      ],
    );
  }

  RichText typeBuyText(BuildContext context) {
    return RichText(
      key: Key('text-image-credit-text-mut-be'),
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(color: Theme.of(context).colorScheme.grayColor),
        text: I18n.of(context).buySharesYourRequestMustBe,
        children: <TextSpan>[
          TextSpan(
              text: ' ' + I18n.of(context).buySharesApproved + '\n',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: I18n.of(context).buySharesForHim + ' '),
          TextSpan(
              text: I18n.of(context).buySharesAdministrator,
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
