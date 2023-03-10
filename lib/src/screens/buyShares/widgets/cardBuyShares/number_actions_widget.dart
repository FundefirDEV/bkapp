import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NumberActions extends StatelessWidget {
  const NumberActions({Key key, @required this.myShares}) : super(key: key);
  final String myShares;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final String actions = I18n.of(context).buySharesActions.toUpperCase();
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        key: Key('number-action-text-column'),
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 25),
              child: SvgPicture.asset(
                'assets/images/money_circle.svg',
                key: Key('number-action-money-image'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                this.myShares,
                key: Key('number-action-value-text'),
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: RichText(
              key: Key('number-action-my-action-text'),
              text: TextSpan(
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: SizeConfig.blockSizeHorizontal * 3.2),
                text: I18n.of(context).buySharesMy + '\n',
                children: <TextSpan>[
                  TextSpan(
                      text: actions,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
