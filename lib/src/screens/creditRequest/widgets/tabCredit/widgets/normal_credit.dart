import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:bkapp_flutter/src/widgets/cardInformationBk/card_information_bk_widget.dart';
import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';

import 'number_actions_widget.dart';

class NormalCredit extends StatelessWidget {
  const NormalCredit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return CardInformationBkWidget(
      childBlue: NumberActions(),
      childBlueWidth: SizeConfig.blockSizeHorizontal * 30,
      childWhite: Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.safeBlockVertical * 2,
            horizontal: SizeConfig.safeBlockHorizontal * 8),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      I18n.of(context).creditScreenYouCanRequest,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3.8,
                          color: Theme.of(context).colorScheme.grayColor[300]),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(r'$900.000',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 6,
                            color: Theme.of(context).colorScheme.grayColor[300],
                            fontWeight: FontWeight.w100)),
                  ),
                )
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      I18n.of(context).creditScreenWithInterest,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3.8,
                          color: Theme.of(context).colorScheme.grayColor[300]),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(r'3%',
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 6,
                            color: Theme.of(context).colorScheme.grayColor[300],
                            fontWeight: FontWeight.w100)),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
