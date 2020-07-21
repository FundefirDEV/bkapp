import 'package:bkapp_flutter/generated/i18n.dart';
import 'package:bkapp_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class FeeDetailWidget extends StatelessWidget {
  FeeDetailWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical * 3.5,
        horizontal: SizeConfig.safeBlockHorizontal * 4.5,
      ),
      child: Column(children: <Widget>[
        Expanded(
            child: Container(
          margin:
              EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 1),
          child: Row(children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Text(I18n.of(context).activeCreditAmountToBePaid)),
                  Text(r'$115.000',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.w100))
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: Text(I18n.of(context).activeCreditDefault)),
                  Text(r'$0',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.w100))
                ],
              ),
            )
          ]),
        )),
        Expanded(
            child: Container(
          margin:
              EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 1),
          child: Row(children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: Text(I18n.of(context).activeCreditCapital)),
                  Text(r'$100.000',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.w100))
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: Text(I18n.of(context).activeCreditInterest)),
                  Text(r'15.000',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.w100))
                ],
              ),
            )
          ]),
        ))
      ]),
    );
  }
}
