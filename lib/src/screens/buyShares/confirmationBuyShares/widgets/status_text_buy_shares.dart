import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class StatusTextBuyShares extends StatelessWidget {
  const StatusTextBuyShares({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      key: Key('status-text-buy-shares-container'),
      alignment: Alignment.center,
      child: RichText(
        key: Key('status-text-buy-shares-text'),
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: I18n.of(context).buySharesStatus + '\n',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: SizeConfig.blockSizeHorizontal * 4)),
            TextSpan(
                text: 'PENDIENTE',
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: SizeConfig.blockSizeHorizontal * 4)),
          ],
        ),
      ),
    );
  }
}
