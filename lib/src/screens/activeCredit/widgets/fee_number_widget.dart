import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class FeeNumberWidget extends StatelessWidget {
  FeeNumberWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 4,
          horizontal: SizeConfig.safeBlockHorizontal * 4),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              '${I18n.of(context).activeCreditInstallments} #1',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          )),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Expanded(
                  child: Text(I18n.of(context).activeCreditMaximumPaymentDate,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700)),
                ),
                Text('20 / 10 / 2020',
                    style: TextStyle(color: Colors.white, fontSize: 12))
              ]))
        ],
      ),
    );
  }
}
